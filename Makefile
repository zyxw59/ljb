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

all: index.html

index.html: grammar.fmt $(SECTIONS:%=$(SECDIR)/%.fmt) $(TABLES:%=$(TABDIR)/%.fmt)
	conlang_fmt < $< > $@

%.pdf: %.tex
	cd $(dir $<) && \
	${xelatex} $(notdir $<)
