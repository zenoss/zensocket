.PHONY: all build clean

ifeq ($(shell uname), SunOS)
	CC=cc
	CFLAGS=-g
	LDFLAGS=-lsocket
else
	CC=gcc
	CFLAGS=-Wall -pedantic -D__GNU_LIBRARY__ -g
	LDFLAGS=
endif

PROGRAM=zensocket

all: build

build: $(PROGRAM)

clean:
	rm -rf $(PROGRAM)

$(DESTDIR)/bin:
	mkdir -p $(DESTDIR)/bin

install: $(DESTDIR)/bin
	cp -p zensocket $(DESTDIR)/bin/zensocket

uninstall:
	rm -f $(DESTDIR)/bin/zensocket

$(PROGRAM): zensocket.c
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $<
