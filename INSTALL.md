# Installation

## Recommended setup

As this package is now released via CTAN, it is hightly recommended to use the TeX Live Manager for installation.

## Minimal portable TeX Live via DEPP

Additionally for it is possible to use the Island of TeX's DEPP project to create a minimal portable TeX Live installation only including the dependencies for this kind of documents. 
This repository includes a DEPENDS.txt for this purpose. 

Please be aware that the soft dependencies are those required to typeset the demo file. 

## Local user level installation using l3build

This package is not yet released to CTAN, but it provides an \pkg{l3build} installation script and demo files.
Details on usage can be found in the [l3build documentation](http://texdoc.net/serve/l3build)/0).

To get started one can run

```shell
l3build doc
```

within the repositories root directory.
This will build the Demo project as well as the current status of the documentation within the subdirectory `build/doc`.

To Install the package within you `$TEXMFHOME` there is also the `install` action

```shell
l3build install
```

This will install the `zugferd.sty`  as well as the `zugferd-invoice.sty` and afterwards the TeX compiler will be able to find and use them.
