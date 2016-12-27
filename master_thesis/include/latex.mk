#
# Makefile for LaTeX projects
# Author: Stanislav Kruchinin <stanislav.kruchinin@gmail.com>
#
# Modified by: Marat Akhin, 2009-2012
#

BIBTEX?=bibtex8
LATEX?=latex
MAKEINDEX?=makeindex
PDFLATEX?=pdflatex

BIBTEXFLAGS?=-B -c gost/utf8cyrillic.csf
LATEXFLAGS?=-src-specials
MAKEINDEXFLAGS?=-s nomencl.ist -o $(TARGET).nls
PDFLATEXFLAGS?=--shell-escape

CLEXT?=*.aux *.toc *.idx *.ind *.ilg *.log *.out *.lof *.lot *.lol \
  *.bbl *.blg *.bak *.dvi *.ps *.pdf *.nlo *.nls *.tdo
CLFILES?=$(CLEXT)

# End of configuration

dvi: $(TARGET).dvi

dvi-fast: $(TARGET).tex $(TARGETFILES)
	$(LATEX) $(TEXFLAGS) $^

pdf: $(TARGET).pdf

pdf-fast: $(TARGET).tex $(TARGETFILES)
	$(PDFLATEX) $(PDFLATEXFLAGS) $^

$(TARGET).dvi: $(TARGET).tex $(TARGETFILES) $(BIBFILE)
	$(LATEX) $(TEXFLAGS) $^
	@if [ -f $(NOMFILE) ]; then \
		$(MAKEINDEX) $(NOMFILE) $(MAKEINDEXFLAGS) ;\
		$(LATEX) $(TEXFLAGS) $^ ;\
	else \
		echo Warning: Index file does not exist ;\
	fi
	@if [ -f $(BIBFILE) ]; then \
		for f in *.aux; do $(BIBTEX) $(BIBTEXFLAGS) $${f%.aux}; done ;\
		$(LATEX) $(TEXFLAGS) $^ ;\
	else \
		echo Warning: Bibliography file does not exist ;\
	fi
	$(LATEX) $(TEXFLAGS) $^

$(TARGET).pdf: $(TARGET).tex $(TARGETFILES) $(BIBFILE)
	$(PDFLATEX) $(PDFLATEXFLAGS) $^
	@if [ -f $(NOMFILE) ]; then \
		$(MAKEINDEX) $(NOMFILE) $(MAKEINDEXFLAGS) ;\
		$(PDFLATEX) $(PDFLATEXFLAGS) $^ ;\
	else \
		echo Warning: Index file does not exist ;\
	fi
	@if [ -f $(BIBFILE) ];\
	then \
		for f in *.aux; do $(BIBTEX) $(BIBTEXFLAGS) $${f%.aux}; done ;\
		$(PDFLATEX) $(PDFLATEXFLAGS) $^ ;\
	else \
		echo Warning: Bibliography file does not exist ;\
	fi
	$(PDFLATEX) $(PDFLATEXFLAGS) $^

epstoeps:
	@$(MAKE) -C fig $@

epstopdf:
	@$(MAKE) -C fig $@

clean:
	rm -f $(CLFILES)
	@$(MAKE) -C fig $@
