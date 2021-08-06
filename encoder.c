#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"
#include <arpa/inet.h>
#include <time.h>

typedef struct opcode {
	char bit;
	struct opcode *next;
} opcode;

void buildLookupTable(struct node* node, char* buffer, char lookupTable[][200]) {
    if (node == NULL) return;
		
	if (node->symbol != -1) {
		strcpy(lookupTable[node->symbol-ALPHABET_OFFSET], buffer);
	}

	// Left sub tree
	char buff2[200];
	strcpy(buff2, buffer);
    buildLookupTable(node->left, strcat(buff2, "0"), lookupTable);
	
	// Right sub tree
	char buff3[200];
	strcpy(buff3, buffer);
    buildLookupTable(node->right, strcat(buff3, "1"), lookupTable);
}

void writeBitOut(char* bit_buffer, FILE* output_file) {
	fwrite(bit_buffer, sizeof(*bit_buffer), 1, output_file);
}

// Returns the length of the optcode added
int addNextChar(char* bit_buffer, int* bit_position, FILE* output_file, char* symbol_opcode) {
	int code_length = 0;
	while(*symbol_opcode != '\0') {
		
		code_length++;

		// Isolate the last bit
		*bit_buffer |= (*symbol_opcode) - '0'; 
		
		(*bit_position)++;

		// Check if bit buffer is full
		if(*bit_position == sizeof(*bit_buffer) * 8) {

			// Write to file
			writeBitOut(bit_buffer, output_file);

			// Reset bit buffer and position
			*bit_buffer = 0x00;
			*bit_position = 0;

		} else {
			// Increment bit buffer
			*bit_buffer = *bit_buffer << 1;
		}
		
		// Next opcode char
		symbol_opcode++;
	}

	return code_length;

}

int main(void)
{
    clock_t program_start = clock();

	setlocale(LC_ALL, "");

	// Open input file
	FILE *inputFile = fopen(FILENAME, "r");

	short frequencies[ALPHABET_SIZE] = {0};
	wint_t c;

	// Increment symbol frequencies
	while ((c = fgetwc(inputFile)) != WEOF)
	{
		frequencies[(short)c - ALPHABET_OFFSET] += 1;
	}

	node* treeNodes = buildHuffmanTree(frequencies);

	FILE* output_file = fopen("encoded.dat", "wb");
	int code_length = 0;
	fseek(output_file, sizeof(code_length), SEEK_SET);

	for (int i = 0; i < ALPHABET_SIZE; i++)
	{
		fwrite(&frequencies[i], sizeof(short), 1, output_file);
	}

	char buffer[200] = {0};
	char lookupTable[200][200];

	buildLookupTable(treeNodes, buffer, lookupTable);

	// Reset file pointer
	fseek(inputFile, 0, SEEK_SET);

	// Increment symbol frequencies
	char* symbol_opcode;
	char bit_buffer = 0x00000000;
	int bit_position = 0;
	
	while ((c = fgetwc(inputFile)) != WEOF)
	{
		symbol_opcode = lookupTable[(int)c - ALPHABET_OFFSET];
		code_length += addNextChar(&bit_buffer, &bit_position, output_file, symbol_opcode);;
	}
	if(bit_position != 0) {
		bit_buffer = bit_buffer << (sizeof(bit_buffer)*8 - bit_position - 1);
		fwrite(&bit_buffer, sizeof(bit_buffer), 1, output_file);
	}

	fseek(output_file, 0, SEEK_SET);
	
	fwrite(&code_length, sizeof(code_length), 1, output_file);

	// Close file IO
	fclose(output_file);
	fclose(inputFile);
	
    clock_t program_stop = clock();
	
    printf("Time elapsed %.0f ms.\n", ((double)(program_stop - program_start) * 1000.0 / CLOCKS_PER_SEC));

	return EXIT_SUCCESS;
}