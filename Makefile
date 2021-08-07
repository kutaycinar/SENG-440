OBJS	= decoder.o encoder.o huffman.o
HEADER	= huffman.h
OUT	= encoder decoder
CC	 = gcc
FLAGS	 = -Wall -c

all: decoder encoder

decoder.o: decoder.c $(HEADER)
	$(CC) $(FLAGS) -o $@ decoder.c

huffman.o: huffman.c $(HEADER)
	$(CC) $(FLAGS) -o $@ huffman.c

encoder.o: encoder.c $(HEADER)
	$(CC) $(FLAGS) -o $@ encoder.c

decoder: decoder.o huffman.o
	$(CC) -o $@ decoder.o huffman.o

encoder: encoder.o huffman.o
	$(CC) -o $@ encoder.o huffman.o

clean:
	rm -f $(OBJS) $(OUT) encoded.dat decoded.txt
