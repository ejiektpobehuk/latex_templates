#!/usr/bin/env bash

build_latex_template()
{

  if [ "$#" != "1" ]; then
    echo "Invalid number of arguments!"
    exit 1
  fi
  
  LATEX_TEMPLATE="$1"
  cd $LATEX_TEMPLATE
  
  pdflatex $LATEX_TEMPLATE.tex
  if [ "$LATEX_TEMPLATE" == "bachelor_thesis" ] || [ "$LATEX_TEMPLATE" == "coursework" ]; then
	bibtex $LATEX_TEMPLATE.aux
  elif [ "$LATEX_TEMPLATE" == "bachelor_thesis" ]; then
	makeindex $LATEX_TEMPLATE.nlo -s nomencl.ist -o $LATEX_TEMPLATE.nls
  fi
  pdflatex $LATEX_TEMPLATE.tex
  pdflatex $LATEX_TEMPLATE.tex

}
