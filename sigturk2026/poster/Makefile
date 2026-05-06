.PHONY: all clean

all: main.pdf

main.pdf: main.typ
	@if command -v typst >/dev/null 2>&1; then \
		typst compile --font-path fonts/ main.typ; \
	else \
		echo "Typst not found. Please install it (e.g. from https://github.com/typst/typst) or use the web app."; \
	fi

clean:
	rm -f main.pdf
