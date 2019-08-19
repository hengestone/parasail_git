#! /bin/tcsh -e

# compile parasail files
# call with "-h" for help

# pslc.csh must be in your path
set dir_called_from = $cwd
set script_loc = "$0"
set bin_dir = $script_loc:h

cd $bin_dir
set bin_dir = $cwd
cd $dir_called_from

set psl_dir = $bin_dir:h
if ("$psl_dir:t" == "install") then
   set psl_dir = $psl_dir:h
endif

# TODO: version
set version_string = "ParaSail LLVM-Based Compiler version 1.0"
alias print_help eval '\
echo "valid flags are"\
echo "  -o <file_name> Set executable output file name"\
echo "  -On            Optimization level, where n is in 0 .. 3."\
echo "  -c             Compile only, do not link"\
echo "                 If -c is *not* supplied, then -m *must* be supplied or"\
echo "                 one of the files must contain a"\
echo "                 func main(Basic_Array<Univ_String>)"\
echo "  -m <name>      Specify the name of the main routine which must"\
echo "                 be declared func <name>(Basic_Array<Univ_String>)"\
echo "  -g             Generate ParaSail debug information."\
echo "                 If -g is not supplied,"\
echo "                 assembly debug information is generated"\
echo "  -s             Compile ParaScope to produce bin/parascope.exe."\
echo "  -i             Use the interpreter to execute the compiler,"\
echo "                 even if bin/compiler.exe exists."\
echo "  -k             Keep .ll and .s intermediate representatations"\
echo "  -bn            Where n is in 1 .. 3."\
echo "                 n = 1 Compile the standard library (10 mins)."\
echo "                 n = 2 Compile (i.e. bootstrap) the compiler (10 mins)."\
echo "                 n = 3 Compile the standard library and bootstrap the compiler."\
echo "                   This may take a long time -- about 20 cpu mins."\
echo "  -l             Linear: do not compile files in parallel."\
echo "  -x             Explicit parallelism only: do not add implicit parallelism."\
echo "  -t             Time: Display the execution time for the compiler."\
echo "  -v             Print version information"\
echo "  -h             Print this help message"\
echo "Before anything else, you must run: bin/pslc.csh -b3"\
echo "(it will take 20+ minutes of CPU time, about 6 mins on a 4-core machine)"'

# Give help if no parameters
if ("$#" == 0) then
   echo $version_string
   print_help
   exit
endif

# a ':' following a letter means that letter takes an argument
set valid_flags = "o:O:cm:gikb:lvhtx"
set argv = `getopt $valid_flags $*`
# TODO: full word arguments with --.
# get opt puts all the options before a -- and all the operands after

# if getopt failed then $? would be nonzero
# if getopt failed then we should fail as well
if ("$?" != 0) then
   echo $version_string
   print_help
   exit "$?"
endif

# default values:
# output executable name (will be "psl.exe" if not otherwise set)
set exe = ""

# clang flags
set debug_asm = "-g"

# ParaSail Flags
set psl_flags = ""
set sequential = 0

# ParaSail interpreter flags
set psli_flags = ""

# llc (ll -> .s) flags
set llc_flags = "-asm-verbose -O=0"

# whether or not to link with Ada
set link = 1

# interpret the compiler or use the compiled compiler
set use_interpreter = 0

# whether or not to delete .ll and .s
set delete_intermediate = 1

# bootstrap = 1 -> compile std library
# bootstrap = 2 -> compile the compiler
# bootstrap = 3 -> compile std library and compiler
# bootstrap = 4 -> compile the static analyzer ParaScope
set compile_parascope = 0

set bootstrap = 0

# main_name = <name-of-main-routine> -> create file <main_name>__main.psl
set main_name = ""
set do_time = ""

# loop over all command line arguments
while ("$1" != "--")
   switch ($1)
      case "-o":
         # set output file name
         set exe = "$2"
         if ("$exe" !~ "/*") then
            # a relative path
            set exe = "$dir_called_from/$2"
         endif
         shift
         breaksw
      case "-O":
         # set optimization level
         set psl_flags = ($psl_flags '"'"-O$2"'"')
         set llc_flags = "-O=$2"
         shift
         breaksw
      case "-c":
         # don't link
         set link = 0
         breaksw
      case "-m":
         # set name of main routine
         set main_name = "$2"
         shift
         breaksw
      case "-s":
         # compile ParaScope
         set compile_parascope = 1
         shift
         breaksw
      case "-g":
         # set debug
         # TODO: debug levels
         set debug_asm = ""
         set psl_flags = ($psl_flags '"'"-g"'"')
         breaksw
      case "-i":
         # use the interpreted compiler
         # instead of the compiled compiler
         set use_interpreter = 1
         breaksw
      case "-k":
         # keep the .ll and the .s
         set delete_intermediate = 0
         breaksw
      case "-b":
         # bootstrap the chunks and compiler itself
         set bootstrap = "$2"
         shift
         breaksw
      case "-l":
         # tell parasail compiler to run loop forward instead of concurrent
         set psl_flags = ($psl_flags '"'"--forward"'"')
         set sequential = 1
         breaksw
      case "-x":
         # tell parasail front end to not insert implicit parallelism
         set psli_flags = ($psli_flags "-parcalls off")
         breaksw
      case "-t":
         # tell parasail compiler to run loop forward instead of concurrent
         set do_time = "time "
         breaksw
      # TODO: case "--version":
      case "-v":
         # print version info and quit
         echo $version_string
         exit
      # TODO: case "--help":
      case "-h":
         # print help info and quit
         echo $version_string
         print_help
         exit
   endsw
   shift
end
shift # ignore the -- that seperates arguments and files
# now, $* only contains files, not arguments

set comp_lib = ""

if ($bootstrap % 2 == 1) then
   # compiling the standard library, so use multi-file
   # standard library to keep sizes moderate
   set standard_library = "$psl_dir/lib/aaa/aaa*.ps?"
   set comp_lib = ""
   set delete_intermediate = 0
else
   # not compiling std library, so can use single-file standard library
   set standard_library = "$psl_dir/lib/aaa.psi"
   set comp_lib = "$standard_library"
endif

set compiler_srcs = "$psl_dir/lib/reflection.ps? $psl_dir/lib/node_tree.ps? $psl_dir/lib/stack.ps? $psl_dir/lib/llvm_printer.ps? $psl_dir/lib/psvm_debugging.ps? $psl_dir/lib/compiler.ps?"

set parascope_srcs = "$psl_dir/lib/reflection.ps? $psl_dir/lib/vn_il.psi $psl_dir/lib/vn_il_stub.psl $psl_dir/lib/psvm_debugging.ps? $psl_dir/lib/parascope.ps?"

set compiler_main = "$psl_dir/lib/compiler_main.psl"

set parascope_extras = "$psl_dir/lib/psvm_debugging.ps? $psl_dir/lib/parascope.ps?"

set parascope_main = "$psl_dir/lib/parascope_main.psl"

set compiler_and_deps = "$standard_library $compiler_srcs"

# depending on the level of bootstrapping,
# add standard library and/or compiler and its dependencies
set files = ""
set to_be_compiled = ""
set objs = ""
foreach i ($*)
   if ("$i:r.o" == "$i") then
      # already compiled
      if ("$i" =~ "/*") then
         set objs = ($objs "$i")
      else
         set objs = ($objs "$dir_called_from/$i")
      endif
   else
      set files = ($files "$i")
   endif
end

if ("$main_name" != "") then
   set main_file = "${main_name}__main.psl"
   rm -rf $main_file
   echo "import $main_name" > $main_file
   echo "func main(Args : Basic_Array<Univ_String>) is" >> $main_file
   echo "   ${main_name}(Args)" >> $main_file
   echo "end func main" >> $main_file
   set files = ($files $main_file)
endif

set to_be_compiled = ($files)

set make_target = "compiled_main"

if ($compile_parascope) then
   set make_target = "compiled_main_with_interp"
endif

if ($bootstrap == 1) then
   # compile the parasail standard library sources
   set to_be_compiled = ($standard_library $files)
   set link = 0
endif
if ($bootstrap == 2) then
   # compile the compiler sources
   if ("$files" == "") then
      set to_be_compiled = ($compiler_srcs $compiler_main)
   else
      set files = ""
      set link = 0
   endif
   set make_target = "compiled_main_with_interp"
   set files = ($files $compiler_main)
endif
if ($bootstrap == 3) then
   # compile the standard library and compiler sources
   set to_be_compiled = ($compiler_and_deps $compiler_main $files)
   set make_target = "compiled_main_with_interp"
   set files = ($files $compiler_main)
endif
if ($bootstrap == 4) then
   # compile the parascope sources
   set to_be_compiled = ($parascope_srcs $parascope_main $files)
   set make_target = "compiled_main_with_interp"
   set files = ($files $parascope_extras)
endif

if ("$exe" == "") then
   # this is the default executable
   set exe = $dir_called_from/psl.exe
   if ($bootstrap == 2 || $bootstrap == 3) then
      # this is where the compiled-compiler resides
      set exe = $psl_dir/bin/compiler.exe
   endif
   if ($bootstrap == 4) then
      # this is where the compiled parascope resides
      set exe = $psl_dir/bin/parascope.exe
   endif
endif

if (! -e $psl_dir/bin/compiler.exe) then
   set use_interpreter = 1
endif

# run the parasail compiler, if necessary
if ("$to_be_compiled" != "") then
   if ($use_interpreter == 1) then
      $do_time $psl_dir/build/bin/parasail_main $psli_flags $compiler_and_deps $files -command Compile $psl_flags $to_be_compiled
   else
      $do_time $psl_dir/bin/compiler.exe $psli_flags $comp_lib $to_be_compiled $psl_dir/lib/compiled_main.psl -command Compiled_Main $psl_flags $to_be_compiled
   endif
endif

if ("$?" != 0) then
   exit "$?"
endif

# the parasail compiler spits out *.psl.ll files
# compile them down to '*.psl.o's
foreach i ($to_be_compiled)
   if ($sequential == 1) then
      #  Be more verbose when compiling sequentially
      echo "   [llc $i.ll]"
   endif
   llc $llc_flags $i.ll
   if ("$?" != 0) then
      exit "$?"
   endif

   clang -c $debug_asm $i.s -o $i.o
   if ("$?" != 0) then
      exit "$?"
   endif

   # optionally delete intermediate representations
   if ($delete_intermediate == 1) then
      rm -f $i.ll
      if ("$debug_asm" == "") then
         # delete asm unless using it for debugging
         rm -f $i.s
      endif
   endif

   if ("$i" =~ "/*") then
      set objs = ($objs "$i.o")
   else
      set objs = ($objs "$dir_called_from/$i.o")
   endif
end

if ($link == 1) then
   # link objs together and with Ada
   if ($bootstrap != 3) then
      set objs = ($objs "$psl_dir/lib/aaa/aaa*.ps?.o")
   endif

   if ($sequential == 1) then
      echo "   [build $make_target]"
      set silent = ""
   else
      set silent = "SILENT=1"
   endif

   cd $psl_dir; make --silent $make_target OBJS="$objs" EXE="$exe" $silent
endif
