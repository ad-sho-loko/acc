CFLAGS=-std=c11 -g -static

acc: acc.c

test: acc
	./test.sh

clean:
	rm -f acc *.o *~ tmp*

# for Host OS
t:
	docker run --rm -v ~/Programs/clang/acc:/acc -w /acc compilerbook make test

.PHONY: test clean
