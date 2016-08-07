all:
	make pdf
	make bib
	make nomenclature
	make pdf
	make pdf

pdf:
	pdflatex bachelor_thesis.tex

bib:
	bibtex bachelor_thesis

nomenclature:
	makeindex thesis.nlo -s nomencl.ist -o thesis.nls

clean:
	rm -f thesis.nls
	rm -f thesis.pdf
