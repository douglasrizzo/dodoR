NAME  = dodoR
SHELL = bash
DATE = `date +'%y.%m.%d %H:%M:%S'`
all: check build install clean
install:
	R CMD INSTALL .
build:
	R CMD build .
check:
	R CMD check .
clean:
	rm -r ..Rcheck dodoR_1.0.tar.gz
docs:
	rm -rf ~/Desktop/html/
	Rscript -e "library('roxygen2');roxygenize('.', roclets=c('rd', 'namespace'))"
	make install
	git checkout gh-pages
	Rscript -e "library('knitr',quietly=TRUE);knit_rd('$(NAME)')"
	git add .
	git commit -m "Atualização da documentação em $(DATE)"
	git push origin gh-pages
	git checkout master
