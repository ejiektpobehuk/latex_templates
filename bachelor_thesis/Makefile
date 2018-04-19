all:
	make pdf
	make bib
	make nomenclature
	make pdf
	make pdf
	make pdf

pdf:
	pdflatex bachelor_thesis.tex

bib:
	bibtex bachelor_thesis

nomenclature:
	makeindex bachelor_thesis.nlo -s nomencl.ist -o bachelor_thesis.nls

clean:
	rm -f bachelor_thesis.nls
	rm -f bachelor_thesis.pdf
