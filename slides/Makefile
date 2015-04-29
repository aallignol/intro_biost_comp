## A Makefile for the presentations

OPTIONS = --slide-level 2 --mathml --no-highlight --variable revealjs-url=/data/git/reveal.js 
STYLE = revealjs

SRC_PRES = $(wildcard *.Rpres)
MD_PRES = $(patsubst %.Rpres, %.md, $(SRC_PRES))
HTML_PRES = $(patsubst %.md, %.html, $(MD_PRES))


all: $(HTML_PRES) $(MD_PRES)
mds: $(MD_PRES)
html: $(HTML_PRES)

%.html: %.md
	pandoc -st $(STYLE) $< -o $@ $(OPTIONS)

%.md: %.Rpres
	Rscript \
	-e "library(knitr)" \
	-e "knitr::knit('$<','$@')"

clean:
	rm -f *.html *.md
