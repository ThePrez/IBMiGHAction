

dist.savf: /qsys.lib/${BUILDLIB}.lib/hello.pgm
	system "CRTSAVF ${BUILDLIB}/dist"
	system "SAVLIB LIB(${BUILDLIB}) DEV(*SAVF) SAVF(${BUILDLIB}/DIST)"
	cp /qsys.lib/${BUILDLIB}.lib/dist.file ./dist.savf

cleanlib:
	system "DLTLIB ${BUILDLIB}"

dist: dist.savf cleanlib

/qsys.lib/${BUILDLIB}.lib/hello.pgm: hello.rpgle
	system "CRTPGM PGM(${BUILDLIB}/HELLO) MODULE(${BUILDLIB}/HELLO)"

/qsys.lib/${BUILDLIB}.lib/hello.pgm: hello.rpgle
	system "CRTLIB ${BUILDLIB}" || echo library ${BUILDLIB} already esists
	system "CLRLIB ${BUILDLIB}"
	system "CRTRPGMOD MODULE(${BUILDLIB}/HELLO) SRCSTMF('${PWD}/hello.rpgle')"

all: dist

clean:
	rm -fr $(shell pwd)