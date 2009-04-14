
main = thesis
chapters = \
  front abstract acknowledgements \
  intro \
  vibrations magnet-theory \
  magnet-design multipole qzs control xpmt \
  conclusion

.PHONY: $(chapters) show clean

show: $(main).pdf
	open $<
	osascript -e 'tell application "Skim" to revert item 1 of (every window whose name contains "'$<'")'

clean:
	rm *.pdf

$(main).pdf: $(main).tex $(addsuffix .tex,$(chapters))
	pdflatex --shell-escape $(main); \
	bibtex $(main)

$(chapters): %: ch-%.pdf
	open $<
	osascript -e 'tell the front window of application "Skim" to revert'

ch-%.pdf: %.tex ch-%.bbl
	pdflatex --shell-escape --jobname=ch-$* \
	  "\includeonly{$*}\input{$(main)}"

ch-%.bbl: $(main).bbl
	cp $(main).bbl ch-$*.bbl
