
report.pdf: report.tex
	pdflatex $<  | tee latex.log | egrep "arning|eror"
	pdflatex $<  | tee latex.log | egrep "arning|eror"

watch: report.pdf
	open $< 
	(watchman-make -p "report.tex" -t "$<" > /dev/null 2> /dev/null &)
	emacsclient -nw ./report.tex

clean:
	rm -f *.synctex.gz *.log *.aux
	rm -f *.bbl *.blg *.fls *.fdb_latexmk *.out *.pdf *.ps main.ppress.tex
	rm -rf auto _region_* submission
	rm -f *.zip
	rm -f *.cb2 *.cb
	rm -rf revision

	

