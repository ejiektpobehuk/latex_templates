SRC = bachelor_thesis

all:
	make pdf
	make bib
	make nomenclature
	make pdf
	make pdf
	make pdf

pdf:
	pdflatex $(SRC).tex

bib:
	bibtex $(SRC)

nomenclature:
	makeindex $(SRC).nlo -s nomencl.ist -o $(SRC).nls

clean:
	rm -f $(SRC).nls
	rm -f $(SRC).pdf
