all:
	make pdf
	make bib
	make nomenclature
	make pdf
	make pdf

pdf:
	pdflatex thesis.tex

bib:
	bibtex thesis

nomenclature:
	makeindex thesis.nlo -s nomencl.ist -o thesis.nls

clean:
	rm thesis.nls
	rm thesis.pdf
