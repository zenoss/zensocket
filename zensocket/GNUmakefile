.PHONY: all build clean

ifeq ($(shell uname),SunOS)
CC      = cc
CFLAGS  = -g
LDFLAGS = -lsocket
else
CC      = gcc
CFLAGS  = -O2 -Wall -Wextra -pedantic -D__GNU_LIBRARY__ -g
LDFLAGS =
endif

PROGRAM = zensocket

all: build

build: $(PROGRAM)

clean:
	rm -rf $(PROGRAM)

install: $(DESTDIR)/bin/$(PROGRAM)
	chmod 550 $<

uninstall:
	rm -f $(DESTDIR)/bin/$(PROGRAM)

$(DESTDIR)/bin:
	mkdir -p $(DESTDIR)/bin

$(DESTDIR)/bin/$(PROGRAM): $(PROGRAM) | $(DESTDIR)/bin
	cp -p $< $@

$(PROGRAM): %: %.c
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $<
