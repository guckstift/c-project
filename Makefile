PROGNAME = myprog

CFILES = $(wildcard src/*.c)
OFILES = $(CFILES:src/%.c=build/%.o)
OFILES_TEST = $(CFILES:src/%.c=build/%_test.o)

build/$(PROGNAME): $(OFILES) | build
	gcc -o $@ $^

build/%.o: src/%.c | build
	gcc -o $@ -c $^

build:
	mkdir $@

clean:
	rm -rf build

rebuild: clean build/$(PROGNAME)

.PHONY: clean rebuild