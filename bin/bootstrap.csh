#! /bin/csh -fe
# Compile .psl files
set exe = "examples/psl.exe"
if "$1" == "-o" then
   set exe = "examples/$2"
   shift; shift
endif

../build/bin/parasail_main aaa?.psi reflection.ps? llvm_printer.ps? compiler.ps? $* -command Compile aaa2.psi $*
set objs = ""
foreach i (aaa2.psi $*)
   llc -asm-verbose -O0 $i.ll
   clang -c -g $i.s
   # rm -f $i.ll $i.s
   set objs = ($objs examples/$i.o)
end

cd ..; make compiled_main OBJS="$objs" EXE="$exe"

