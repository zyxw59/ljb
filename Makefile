SECTIONS=phonology\
	 sentence_structure\
	 verbs\
	 particles\
	 nouns\
	 example_sentences
SECDIR=sections
TABLES=conjunctions\
       derived_verbs\
       nominalizers\
       nouns\
       quantifiers\
       roots\
       secondary_nominal\
       verbal_derivational_endings
TABDIR=tables
xelatex=latexmk -xelatex -interaction=nonstopmode

all: grammar.pdf

grammar.pdf: grammar.tex $(SECTIONS:%=$(SECDIR)/%.tex) $(TABLES:%=$(TABDIR)/%.tex)
	${xelatex} $<

%.pdf: %.tex
	cd $(dir $<) && \
	${xelatex} $(notdir $<)
