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

$(PROGRAM): zensocket.c
	$(CC) -o $@ $(CFLAGS) $(LDFLAGS) $<
