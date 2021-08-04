#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"

int getNextBit(char* bit_buffer, int* bit_position, FILE* inputFile, int* remaining_bits) {
	if (*bit_position == 0)
	{
		if(fread(bit_buffer, sizeof(*bit_buffer), 1, inputFile) < 1) {
			return -1;
		}
		*bit_position = sizeof(*bit_buffer)*8;
	}

	// Only look at furthest right bit
	int nextBit = (*bit_buffer & 0b10000000) >> 7;
	printf("%d", nextBit);
	(*bit_position)--;
	(*remaining_bits)--;
	*bit_buffer = *bit_buffer << 1;

	return nextBit;
	
}

int main(void) {
	
	setlocale(LC_ALL, "");

	FILE* inputFile = fopen("encoded.dat", "rb");

	int remaining_bits;
	fread(&remaining_bits, sizeof(remaining_bits), 1, inputFile);
	
	// tree reading
	short frequencies[ALPHABET_SIZE] = {0};
	short text_buffer;

	// Parse frequencies from file
	for (int i = 0; i < ALPHABET_SIZE; i++)
	{
		fread(&text_buffer, sizeof(short), 1, inputFile);
		frequencies[i] = text_buffer;
	}

	// Build Huffman Tree
	node* huffmanTree = buildHuffmanTree(frequencies);
	printHuffmanTree(huffmanTree);

	// Read second line.
	// Traverse huffman tree until leaf node is found
	FILE* outputFile = fopen("decoded.txt", "w");
	char bit_buffer = 0;
	int bit_position = 0;
	int nextBit;
	struct node* adventurer = huffmanTree;
	do {
		
		nextBit = getNextBit(&bit_buffer, &bit_position, inputFile, &remaining_bits);
		if(nextBit == 0) {
			adventurer = adventurer->left;
		}
		if(nextBit == 1) {
			adventurer = adventurer->right;
		}
		if(adventurer->symbol != -1)
		{
			fwprintf(outputFile, L"%C", adventurer->symbol);
			adventurer = huffmanTree;
		}
		
	} while(nextBit != -1 && remaining_bits > 0);
	
	fclose(inputFile);
	fclose(outputFile);
	 
}