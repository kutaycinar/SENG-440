#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"

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

int main(void)
{
	setlocale(LC_ALL, "");

	// Open input file
	FILE *inputFile = fopen("output10k.txt", "r");

	int frequencies[ALPHABET_SIZE] = {0};

	wint_t c;

	// Increment symbol frequencies
	while ((c = fgetwc(inputFile)) != WEOF)
	{
		frequencies[(int)c - ALPHABET_OFFSET] += 1;
	}

	node* treeNodes = buildHuffmanTree(frequencies);

	FILE* outputFile = fopen("encoded.txt", "w");

	// writeHuffmanTree(treeNodes[0], &outputFile);

	for (int i = 0; i < ALPHABET_SIZE; i++)
	{
		fprintf(outputFile, "%d ", frequencies[i]);
	}

	fprintf(outputFile, "\n");

	char buffer[200] = {0};
	char lookupTable[200][200];

	buildLookupTable(treeNodes, buffer, lookupTable);

	// Reset file pointer
	fseek(inputFile, 0, SEEK_SET);

	// Increment symbol frequencies
	while ((c = fgetwc(inputFile)) != WEOF)
	{
		fprintf(outputFile, "%s", lookupTable[(int)c - ALPHABET_OFFSET]);
	}

	fclose(outputFile);

	fclose(inputFile);

	return EXIT_SUCCESS;
}