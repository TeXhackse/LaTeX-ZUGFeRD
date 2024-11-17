# ZUGFeRD - Create ZUGFeRD and other kinds of E-invoices using LaTeX

Copyright (C) 2023–2024 by Marei Peischl (peiTeX) <marei@peitex.de>

zugferd version 0.9a (2024-11-07)

***************************************************************************

 This material is subject to the LaTeX Project Public License version 1.3c
 or later. See <http://www.latex-project.org/lppl.txt> for details.

***************************************************************************

## Abstract

This package provides an interface to make your LaTeX-based invoicing compatible to e-invoicing standards, such as they exist in the EU.

The package includes a demo implementation, which can be used by template developers to create their own company specific variant. The included example file shows how to use it. This package is built so it also creates the XML file which will be directly attached to the PDF.

There also exist interfaces to attach an XML file generated differently. Please have a look at the documentation.

This package does not provide any validation. Please be aware of you have to use valid input data for a valid ZUGFeRD output. The documentation suggests some options.

## Version History

* 0.9a (2024-11-07)
   - Add support for MINIMUM profile
   - Bugfix in demo package concerning rounding of non integer units.
* 0.9  (2024-10-23)
   - Improve validation in testing of the development status.
   - Add support for BillingSpecifiedPeriod
   - Add additional user interfaces to simplify development for templates
* 0.8a (2024-09-17) Patch to switch to the newly public interface of l3pdfmeta
* 0.8  (2024-09-11) First version on CTAN
