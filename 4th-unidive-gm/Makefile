MAIN = main

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex references.bib acl.sty acl_natbib.bst
	latexmk -pdf -bibtex -interaction=nonstopmode -quiet $(MAIN).tex

clean:
	latexmk -c $(MAIN).tex
	rm -f *.bbl *.blg

distclean:
	latexmk -C $(MAIN).tex
	rm -f *.bbl *.blg

.PHONY: all clean distclean
