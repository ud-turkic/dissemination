.PHONY: all check preview clean

all: main.pdf

main.pdf: main.typ
	@if command -v typst >/dev/null 2>&1; then \
		typst compile --font-path fonts/ main.typ; \
	else \
		echo "Typst not found. Install it (https://github.com/typst/typst) or use typst.app."; \
	fi

# Pre-upload sanity check. Run this before sharing the deck with the team.
check: main.pdf
	@echo "== overflow (rendered pages vs. declared slides) =="
	@pages=$$(pdfinfo main.pdf | awk '/^Pages:/ {print $$2}'); \
	slides=$$(( $$(grep -c '^== ' main.typ) + $$(grep -c '^= ' main.typ) + 1 )); \
	echo "   rendered=$$pages declared=$$slides"; \
	if [ "$$pages" = "$$slides" ]; then echo "   OK"; \
	else echo "   MISMATCH - a slide is overflowing onto a second page"; exit 1; fi
	@echo "== leftover placeholders =="
	@if grep -nE 'TODO|FIXME|TBD|XXX|placeholder|see README' main.typ; then \
		echo "   found - clean these up"; exit 1; else echo "   none"; fi
	@echo "== image references =="
	@grep -oE 'image\("images/[^"]+"' main.typ | sed 's/image("//;s/"//' | sort -u > /tmp/.typ-ref; \
	ls images/ | sed 's|^|images/|' | sort > /tmp/.typ-have; \
	missing=$$(comm -23 /tmp/.typ-ref /tmp/.typ-have); \
	unused=$$(comm -13 /tmp/.typ-ref /tmp/.typ-have); \
	if [ -n "$$missing" ]; then echo "   MISSING: $$missing"; exit 1; fi; \
	if [ -n "$$unused" ]; then echo "   unused (will bloat the upload): $$unused"; \
	else echo "   OK"; fi
	@echo "== every image is a real image, not a failed download =="
	@for f in images/*; do \
		case "$$(file -b --mime-type $$f)" in image/*) ;; \
		*) echo "   NOT AN IMAGE: $$f"; exit 1;; esac; done; echo "   OK"
	@echo
	@echo "All checks passed. Now eyeball the slides: make preview"

# Render every slide to PNG so you can page through them.
preview: main.typ
	typst compile --font-path fonts/ --format png --ppi 90 main.typ 'page-{p}.png'
	@echo "Wrote $$(ls page-*.png | wc -l) PNGs. Open them, or just open main.pdf."

clean:
	rm -f main.pdf page-*.png
