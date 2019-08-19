#! /bin/csh -fe
# Compile .ll files
set exe = "examples/psl.exe"
if "$1" == "-o" then
   set exe = "examples/$2"
   shift; shift
endif

set objs = ""
foreach i ($*)
   llc -asm-verbose -O0 $i
   clang -c -g $i:r.s
   # rm -f $i:r.s
   set objs = ($objs examples/$i:r.o)
end

cd ..; make compiled_main OBJS="$objs" EXE="$exe"

