
prefix=/tmp

all: ex1 libex2.so

run:
	./ex1

.PHONE: clean

clean:
	rm -f *.o libex2.so ex1

install: ex1 libex2.so
	install -d $(prefix)/usr/bin
	install -d $(prefix)/usr/lib
	install -d $(prefix)/usr/include 
	cp ex1 $(prefix)/usr/bin/
	cp libex2.so $(prefix)/usr/lib/
	cp ex2.h $(prefix)/usr/include


uninstall:
	rm -f $(prefix)/usr/bin/ex1
	rm -f $(prefix)/usr/lib/libex2.so
	rm -f $(prefix)/usr/include/ex2.h

ex1: ex1_corrected.o | libex2.so
	gcc -L. -Wall -Wl,-rpath='$$ORIGIN/../lib' -Wl,-rpath='$$ORIGIN' -o ex1 $< -lex2

libex2.so:  ex2.o
	gcc -shared -o libex2.so ex2.o

%.o : %.c
	gcc -I. -Wall -c $< -o $@
