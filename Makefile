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

grammar.pdf: grammar.tex $(SECTIONS:%=$(SECDIR)/%.tex) $(TABLES:%=$(TABDIR)/%.tex)
	latexmk -xelatex $<
