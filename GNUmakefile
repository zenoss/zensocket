.PHONY: all dist rpm

SOURCES = ~/rpmbuild/SOURCES
VERSION = $(shell grep Version zensocket.spec | cut -f 2)
SOURCE_TAR = $(SOURCES)/zensocket-$(VERSION).tar.gz

all: dist

dist: $(SOURCE_TAR)

rpm: dist
	rpmbuild -ba zensocket.spec

$(SOURCE_TAR):
	mkdir -p $(SOURCES)
	tar czf $(SOURCE_TAR) zensocket
