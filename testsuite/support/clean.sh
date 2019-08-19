#!/bin/bash

find . -name "*~" -exec rm -v \{\} \;
find . -name "*.lst" -exec rm -v \{\} \;
find . -name "errors.err" -exec rm -v \{\} \;
find . -name "*psl.*" -exec rm -v \{\} \;

rm -fv aaa.psi
rm -fv aaa.ski
rm -rf aaa.jli
rm -rf aaa.pri
# rm -fv runtests.*

if test -d tmp; then
   rm -rfv tmp
fi

if test -d tmp.rts; then
   rm -rfv tmp.rts
fi
