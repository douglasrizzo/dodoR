PKGNAME := $(shell sed -n "s/Package: *\([^ ]*\)/\1/p" DESCRIPTION)
PKGVERS := $(shell sed -n "s/Version: *\([^ ]*\)/\1/p" DESCRIPTION)
DATE = `date +'%y.%m.%d %H:%M:%S'`
all: check build install clean
install:
	cd ..;\
	R CMD INSTALL $(PKGNAME)
build:
	cd ..;\
	R CMD build $(PKGNAME) && mv $(PKGNAME)_$(PKGVERS).tar.gz $(PKGNAME)
check:
	cd ..;\
	R CMD check $(PKGNAME) && mv $(PKGNAME).Rcheck $(PKGNAME)
clean:
	rm -rf $(PKGNAME)_$(PKGVERS).tar.gz $(PKGNAME).Rcheck
docs:
	Rscript -e "library('roxygen2');roxygenize('.')"
	R CMD Rd2pdf --batch --title=$(PKGNAME) --output=$(PKGNAME).pdf --force .
	make install
	Rscript -e "library('knitr',quietly=TRUE);knit_rd('$(PKGNAME)')"
	rm -rf html
	mkdir html
	mv *.html R.css html
updocs: 
	rm -rf ../html
	mv html ..
	git checkout gh-pages
	mv ../html .
	git add .
	git commit -m "Atualização da documentação em $(DATE)"
	git push origin gh-pages
	git checkout master
