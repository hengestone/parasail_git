# Parasail git
Open source files from the Parasail 8.4 release.

# Getting started
Following the instructions in `documentation/parasail_release_notes.txt -> BUILDING PARASAIL FROM SOURCES` on Ubuntu 19.10:
 - `apt-get install gnat texlive llvm clang`
 - `make -j 6 all_no_gtk`
 - `bin/pslc.csh -d -b3`
# Editor support
Oliver Henley made a syntax highlighting plugin for VS Code at https://github.com/ohenley/parasail-vscode 
It can be installed it from the VS Code Extensions Marketplace as well, search for `Parasail`.

# Licensing
Parasail is developed by AdaCore, and licensed mostly under the GPLv3, unless otherwise specified in any individual file. The standard library is provided using the GCC GPL V3.1 Runtime Exception, see the file `documentation/GCC_RUNTIME3_1`

This repository is provided persuant to the letter and spirit of the above licenses in an effort to explore and publicize Parasail/Paython/Javallel beyond the confines of AdaCore.
