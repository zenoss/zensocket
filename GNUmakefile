.PHONY: all sdist dist rpm

ARCHITECTURE = $(shell uname -m)
PROJECT = zensocket
TOPDIR = rpmbuild
SOURCES = $(TOPDIR)/SOURCES
VERSION = 1.0.0
PREFIX = /usr
SOURCE_TAR = $(SOURCES)/$(PROJECT)-$(VERSION).tar.gz
DIST_TAR = $(PROJECT)-$(VERSION)-$(ARCHITECTURE).tar.gz
DESTDIR=$(shell pwd)/install

all: dist

sdist: $(SOURCE_TAR)

dist: $(DIST_TAR)

rpm: sdist $(PROJECT).spec
	rpmbuild --define "_topdir $(PWD)/$(TOPDIR)" -ba $(PROJECT).spec

$(PROJECT).spec: in.spec
	sed $< \
		-e 's/@@VERSION@@/$(VERSION)/' \
		-e 's/@@PREFIX@@/$(subst /,\/,$(PREFIX))/' \
		> $@

$(SOURCES) $(DESTDIR):
	mkdir -p $@

$(SOURCE_TAR): | $(SOURCES)
	tar czf $@ $(PROJECT)

$(DIST_TAR): | $(DESTDIR)
	make -C $(PROJECT) uninstall clean build install DESTDIR=$(DESTDIR)
	tar czf $(DIST_TAR) -C install .

clean:
	@rm -vrf $(DESTDIR) $(TOPDIR)
	@rm -vf $(DIST_TAR) $(SOURCE_TAR) $(PROJECT).spec
