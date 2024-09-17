# ZUGFeRD - Create ZUGFeRD and other kinds of E-invoices using LaTeX

Copyright (C) 2023–2024 by Marei Peischl (peiTeX) <marei@peitex.de>

zugferd version 0.8 (2024-09-11)

***************************************************************************

 This material is subject to the LaTeX Project Public License version 1.3c
 or later. See http://www.latex-project.org/lppl.txt for details.

***************************************************************************

## Abstract

This package provides an interface to make your LaTeX-based invoicing compatible to e-invoicing standards, such as they exist in the EU.

The package includes a demo implementation, which can be used by template developers to create their own company specific variant. The included example file shows how to use it. This package is built so it also creates the XML file which will be directly attached to the PDF.

There also exist interfaces to attach an XML file generated differently. Please have a look at the documentation.

This package does not provide any validation. Please be aware of you have to use valid input data for a valid ZUGFeRD output. The documentation suggests some options.

## Overview of the included files

The package is created using docstrip. To install the LaTeX-Package have a look at  the [Installation Instructions](##installation).

It consists of the following files:

* DEMO-rechnung-zugferd.tex: Example file for an invoice. It is using the `zugferd-invoice.sty` also provided within this project.

* zugferd-invoice.sty: An example package to show how one can use the zugferd fuctionality within an own wrapper. This file is meant to be some kind of template for your own setup. Feel free to share your own variants.

* zugferd.ins + zugferd.dtx: docstrip bundle containing the actul source code and documentation.  It can be build and typeset using the commands shown below.

## Installation

It's recommended to use a Vanilla TeX Live installation. For other options see INSTALL.md
