NAME  = dodoR
SHELL = bash
all:	teste
	cd ..
	R CMD build dodoR
	cd dodoR
teste:
	R CMD check .
