#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"
#include <arpa/inet.h>

typedef struct opcode {
	char bit;
	struct opcode *next;
} opcode;

void buildLookupTable(struct node* node, char* buffer, char lookupTable[][200]) {
    if (node == NULL) return;
		
	if (node->symbol != -1) {
		strcpy(lookupTable[node->symbol-ALPHABET_OFFSET], buffer);
		
		/* first print data of node */
    	printf("%C -> (%s) ", node->symbol, lookupTable[node->symbol-ALPHABET_OFFSET]);
	}

    /* then recur on left sutree */
	char buff2[200];
	strcpy(buff2, buffer);
    buildLookupTable(node->left, strcat(buff2, "0"), lookupTable);
	
    /* now recur on right subtree */
	char buff3[200];
	strcpy(buff3, buffer);
    buildLookupTable(node->right, strcat(buff3, "1"), lookupTable);
}

void addNextChar(int* bit_buffer, int* bit_position, FILE* outputFile, char* symbol_opcode) {
	while(*symbol_opcode != '\0') {
		// printf("Symbol Code: %d Bit Position:%d\n", *symbol_opcode - '0', *bit_position);

		*bit_buffer |= (*symbol_opcode) - '0';
		
		(*bit_position)++;

		// Check if bit buffer is full
		if(*bit_position == sizeof(*bit_buffer) * 8) {

			// Write to file
			fwrite(bit_buffer, sizeof(*bit_buffer), 1, outputFile);

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



}

int main(void)
{
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

	FILE* outputFile = fopen("encoded.dat", "wb");

	for (int i = 0; i < ALPHABET_SIZE; i++)
	{
		fwrite(&frequencies[i], sizeof(short), 1, outputFile);
	}

	char line_seperator = '\n';
	fwrite(&line_seperator, sizeof(char), 1, outputFile);

	char buffer[200] = {0};
	char lookupTable[200][200];

	buildLookupTable(treeNodes, buffer, lookupTable);

	// Reset file pointer
	fseek(inputFile, 0, SEEK_SET);

	// Increment symbol frequencies
	char* symbol_opcode;
	int bit_buffer = 0x00000000;
	int bit_position = 0;
	printf("\n");
	while ((c = fgetwc(inputFile)) != WEOF)
	{
		symbol_opcode = lookupTable[(int)c - ALPHABET_OFFSET];
		addNextChar(&bit_buffer, &bit_position, outputFile, symbol_opcode);
	}
	if(bit_position != 0) {
		bit_buffer = bit_buffer << (sizeof(bit_buffer) - bit_position);
		fwrite(&bit_buffer, sizeof(bit_buffer), 1, outputFile);
	}

	fclose(outputFile);

	fclose(inputFile);

	return EXIT_SUCCESS;
}