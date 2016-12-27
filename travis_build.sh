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
  case "$LATEX_TEMPLATE" in
	"bachelor_thesis"|"master_thesis" )
		bibtex $LATEX_TEMPLATE.aux
		makeindex $LATEX_TEMPLATE.nlo -s nomencl.ist -o $LATEX_TEMPLATE.nls
	;;
	
	"coursework" )
		bibtex $LATEX_TEMPLATE.aux
	;;
  esac
  
  pdflatex $LATEX_TEMPLATE.tex
  pdflatex $LATEX_TEMPLATE.tex

}
