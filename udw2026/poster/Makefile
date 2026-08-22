all: main.pdf

main.pdf: main.typ
	typst compile --font-path fonts main.typ main.pdf

clean:
	rm -f main.pdf
