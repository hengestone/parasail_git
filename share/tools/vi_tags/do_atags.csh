#!/bin/csh -f
rm -f tags
share/tools/vi_tags/adatags -r semantics/*.ad? interpreter/*.ad? parser/*.ad?

cd semantics
rm -f tags
../share/tools/vi_tags/adatags -r ../semantics/*.ad? ../interpreter/*.ad? ../parser/*.ad?

rm -f ../interpreter/tags; ln -s ../semantics/tags ../interpreter/tags
rm -f ../examples/tags; ln -s ../semantics/tags ../examples/tags
rm -f ../sparkel_examples/tags; ln -s ../semantics/tags ../sparkel_examples/tags
rm -f ../javallel_examples/tags; ln -s ../semantics/tags ../javallel_examples/tags
rm -f ../parython_examples/tags; ln -s ../semantics/tags ../parython_examples/tags
rm -f ../parser/tags; ln -s ../semantics/tags ../parser/tags
rm -f ../sparkel_parser/tags; ln -s ../semantics/tags ../sparkel_parser/tags
rm -f ../javallel_parser/tags; ln -s ../semantics/tags ../javallel_parser/tags
rm -f ../parython_parser/tags; ln -s ../semantics/tags ../parython_parser/tags
if (-x ../_gnat_build) then
   rm -f ../_gnat_build/tags; ln -s ../semantics/tags ../_gnat_build/tags
endif
if (-x ../_build) then
   rm -f ../_build/tags; ln -s ../semantics/tags ../_build/tags
endif
rm -f ../design/tags; ln -s ../semantics/tags ../design/tags
rm -f ../documentation/tags; ln -s ../semantics/tags ../documentation/tags

