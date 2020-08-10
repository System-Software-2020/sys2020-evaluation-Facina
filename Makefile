build_asm:
	nasm -f elf32 ex1.asm
	ld -m elf_i386 -s -o ex1 ex1.o

all: ex2 install2 ex1	
	
install: 
	install2 install1
	
clean:
	rm -f *.so ex1

run:
	./ex1	
	
install1: ex1
	cp ex1 $(PREFIX)/usr/bin/
	chmod +x $(PREFIX)/usr/bin/ex1	
	
install2: ex2
	cp libex2.so $(PREFIX)/usr/lib/
	cp ex2.h $(PREFIX)/usr/include/
	
ex1: ex2
	gcc ex1_corrected.c -o ex1 -lex2

ex2:
	gcc -shared -o libex2.so -fpic ex2.c
	
uninstall:
	rm $(PREFIX)/usr/lib/libex2.so
	rm $(PREFIX)/usr/include/ex2.h
	rm $(PREFIX)/usr/bin/ex1
	

