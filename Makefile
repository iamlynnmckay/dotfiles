.PHONY: all clean install

all: clean install

install: clean
	./main.sh --install

clean:
	./main.sh --clean