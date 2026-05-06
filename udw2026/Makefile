TEX = pdflatex
BIBTEX = bibtex
MAIN = main
FLAGS = -interaction=nonstopmode

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib languageresource.bib lrec2026.sty
	$(TEX) $(FLAGS) $(MAIN)
	-$(BIBTEX) $(MAIN)
	-$(BIBTEX) languageresource
	$(TEX) $(FLAGS) $(MAIN)
	$(TEX) $(FLAGS) $(MAIN)

clean:
	rm -f *.aux *.bbl *.blg *.log *.out *.fdb_latexmk *.fls *.pdf *.synctex.gz

distclean: clean
	rm -f $(MAIN).pdf

.PHONY: all clean distclean
