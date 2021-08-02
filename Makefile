OBJS	= decoder encoder
HEADER	= huffman.h
OUT	= a.out
CC	 = gcc
FLAGS	 = -Wall

all: decoder.o encoder.o

decoder.o: decoder.c $(HEADER) huffman.c
	$(CC) $(FLAGS) -o $@ decoder.c huffman.c

encoder.o: encoder.c $(HEADER) huffman.c
	$(CC) $(FLAGS) -o $@ encoder.c huffman.c

clean:
	rm -f $(OBJS) $(OUT)

run: $(OUT)
	./$(OUT)
