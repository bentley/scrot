.POSIX:
.SUFFIXES: .c .o

all: scrot

SCROT_OBJECTS = \
	src/imlib.o \
	src/main.o \
	src/options.o

scrot: $(SCROT_OBJECTS)
	$(CC) -o $@ $(CFLAGS) `pkg-config --libs imlib2 giblib` \
		$(SCROT_OBJECTS)

.c.o:
	$(CC) $(CFLAGS) `pkg-config --cflags imlib2` -c -o $*.o $<

clean:
	rm -f $(SCROT_OBJECTS) scrot
