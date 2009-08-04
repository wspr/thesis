
main = thesis
support = thesis-preamble.sty thesis-maths.sty
chapters = \
  front abstract acknowledgements contents \
  intro magnet-theory \
  magnet-design multipole qzs control xpmt \
  conclusion

.PHONY: $(chapters) show clean

show: $(main).pdf $(main).bbl
	open $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

clean:
	rm -f *.pdf *.bbl *.aux *.log *.out *.toc *.blg *.lof *.lot *-blx.bib
	

$(main).pdf: $(main).tex $(addsuffix .tex,$(chapters)) $(support)
	pdflatex --shell-escape $(main); \
	bibtex $(main)

$(chapters): %: ch-%.pdf
	open $<
	osascript -e 'tell the front window of application "Skim" to revert'

ch-%.pdf: %.tex ch-%.bbl ch-%.aux $(support)
	pdflatex --shell-escape --jobname=ch-$* \
	  "\includeonly{$*}\input{$(main)}"

ch-%.bbl: $(main).bbl
	cp $(main).bbl ch-$*.bbl

ch-%.aux: $(main).aux
	cp $(main).aux ch-$*.aux
