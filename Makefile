NAME  = dodoR
SHELL = bash
all: checl build install clean
install:
	R CMD INSTALL .
build:
	R CMD build .
check:
	R CMD check .
clean:
	rm -r ..Rcheck dodoR_1.0.tar.gz
knitdocs:
	rm -rf html/
	make install
	Rscript -e "library('knitr',quietly=TRUE);knit_rd('dodoR')"
	mkdir html
	mv *.html R.css html/
