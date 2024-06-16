# ZUGFeRD

Package to create Faktur-X and ZUGFeRD invoices using LaTeX

––––––––––––––––––––––––––

Copyright (C) 2023–2024 by Marei Peischl (peiTeX) <marei@peitex.de>

## Overview of the included files

The package is created using docstrip. To install the LaTeX-Package have a look at  the [Installation Instructions](##installation).

It consists of the following files:



* DEMO-rechnung-zugferd.tex: Example file for an invoice. It is using the `zugferd-invoice.sty` also provided within this project.

* zugferd-invoice.sty: An example package to show how one can use the zugferd fuctionality within an own wrapper. This file is meant to be some kind of template for your own setup. Feel free to share your own variants.

* zugferd.ins + zugferd.dtx: docstrip bundle containing the actul source code and documentation.  It can be build and typeset using the commands shown below.

## Installation

This package is not yet released to CTAN, but it provides an \pkg{l3build} installation script and demo files.
Details on usage can be found in the [l3build documentation](http://texdoc.net/serve/l3build)/0).

To get started one can run
```
l3build doc
```

within the repositories root directory.
This will build the Demo project as well as the current status of the documentation within the subdirectory `build/doc`.

To Install the package withi the users `$TEXMFHOME` there is also the `install` action

```
l3build install
```
This will install the `zugferd.sty`  as well as the `zugferd-invoice.sty` and afterwards both of them can be used without a copy inside the working directory.
