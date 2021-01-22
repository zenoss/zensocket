.PHONY: all sdist dist rpm

ARCH       = $(shell uname -m)
PROJECT    = zensocket
TOPDIR     = rpmbuild
SOURCES    = $(TOPDIR)/SOURCES
PREFIX     = /usr
VERSION    = $(shell cat VERSION)
SOURCE_TAR = $(SOURCES)/$(PROJECT)-$(VERSION).tar.gz
DIST_TAR   = $(PROJECT)-$(VERSION)-$(ARCH).tar.gz
DESTDIR    = $(shell pwd)/install

all: dist

sdist: $(SOURCE_TAR)

dist: $(DIST_TAR)

rpm: sdist $(PROJECT).spec
	rpmbuild -v --define "_topdir $(PWD)/$(TOPDIR)" -ba $(PROJECT).spec

$(PROJECT).spec: in.spec
	@sed $< \
		-e 's/@@VERSION@@/$(VERSION)/' \
		-e 's/@@PREFIX@@/$(subst /,\/,$(PREFIX))/' \
		> $@

$(SOURCES) $(DESTDIR):
	@mkdir -vp $@

$(SOURCE_TAR): | $(SOURCES)
	@tar czf $@ $(PROJECT)

$(DIST_TAR): | $(DESTDIR)
	make -C $(PROJECT) uninstall clean build install DESTDIR=$(DESTDIR)
	tar czf $(DIST_TAR) -C $(DESTDIR) bin

clean:
	@rm -vrf $(DESTDIR) $(TOPDIR)
	@rm -vf $(DIST_TAR) $(SOURCE_TAR) $(PROJECT).spec
	@make -C $(PROJECT) clean
