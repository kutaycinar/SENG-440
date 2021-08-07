#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"
#include <time.h>


int getNextBit(char* bit_buffer, int* bit_position, FILE* input_file, int* remaining_bits) {
	if (*bit_position == 0)
	{
		if(fread(bit_buffer, sizeof(*bit_buffer), 1, input_file) < 1) {
			return -1;
		}
		*bit_position = sizeof(*bit_buffer)*8;
	}

	// Only look at furthest right bit
	int nextBit = (*bit_buffer & 0b10000000) >> 7;
	(*bit_position)--;
	(*remaining_bits)--;
	*bit_buffer = *bit_buffer << 1;

	return nextBit;
	
}

int readEncoderLength(FILE* input_file) {
	int remaining_bits;
	fread(&remaining_bits, sizeof(remaining_bits), 1, input_file);	
	return remaining_bits;
}
	
struct node* readTreeFromFile(FILE* input_file) {
	
	// Tree reading
	short frequencies[ALPHABET_SIZE] = {0};
	short text_buffer;

	// Parse frequencies from file
	for (int i = 0; i < ALPHABET_SIZE; i++)
	{
		fread(&text_buffer, sizeof(short), 1, input_file);
		frequencies[i] = text_buffer;
	}
	
	// Build Huffman Tree
	node* huffmanTree = buildHuffmanTree(frequencies);

	return huffmanTree;
	
}

struct node* decodeNextBit(node* adventurer, char* bit_buffer, int* bit_position, int* next_bit, int* remaining_bits, FILE* input_file, FILE* output_file) {
	*next_bit = getNextBit(bit_buffer, bit_position, input_file, remaining_bits);
	if(*next_bit == 0) {
		adventurer = adventurer->left;
	}
	if(*next_bit == 1) {
		adventurer = adventurer->right;
	}
	return adventurer;
}

void decodeText(node* huffmanTree, FILE* input_file, FILE* output_file, int remaining_bits) {
	char bit_buffer = 0;
	int bit_position = 0;
	int next_bit;
	struct node* adventurer = huffmanTree;
	do {
		adventurer = decodeNextBit(adventurer, &bit_buffer, &bit_position, &next_bit, &remaining_bits, input_file, output_file);
		if(adventurer->symbol != -1) {
			fwprintf(output_file, L"%C", adventurer->symbol);
			adventurer = huffmanTree;
		}
	} while(next_bit != -1 && remaining_bits > 0);
}

int main(void) {
	
    clock_t program_start = clock();
	
	setlocale(LC_ALL, "");

	FILE* input_file = fopen("encoded.dat", "rb");

	// Get the size of the encoding
	int remaining_bits = readEncoderLength(input_file);
	node* huffmanTree = readTreeFromFile(input_file);

	// Traverse huffman tree until leaf node is found
	FILE* output_file = fopen("decoded.txt", "w");
	decodeText(huffmanTree, input_file, output_file, remaining_bits);
	
	fclose(input_file);
	fclose(output_file);

    clock_t program_stop = clock();

    printf("Time elapsed %.0f ms.\n", ((double)(program_stop - program_start) * 1000.0 / CLOCKS_PER_SEC));

	return EXIT_SUCCESS;
}