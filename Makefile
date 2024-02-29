PAPER = main
FILE = "${PAPER}.tex"
ALL = ${wildcard *.sty *.tex}
BIB = bib/*.bib
OUT_DIR = ./out
COMPILER_ALL = pdflatex -synctex=1 --halt-on-error -output-directory="${OUT_DIR}"
COMPILER_DRAFT = pdflatex -draftmode --halt-on-error -output-directory="${OUT_DIR}"

all:
	@echo "Compiling all..."
	${COMPILER_ALL} ${FILE}
	#biber "${OUT_DIR}/main" # For biblatex
	bibtex "${OUT_DIR}/main" # Else
	${COMPILER_ALL} ${FILE}
	${COMPILER_ALL} ${FILE}

fast:
	@echo "Compiling fast..."
	${COMPILER_ALL} ${FILE}

draft:
	@echo "Compiling draft..."
	${COMPILER_DRAFT} ${FILE}

clean:
	@echo "Cleaning up..."
	-rm out/*
