NAME  = dodoR
SHELL = bash
all: teste build install clean
install:
	R CMD INSTALL .
build:
	R CMD build .
teste:
	R CMD check .
clean:
	rm -r ..Rcheck dodoR_1.0.tar.gz
