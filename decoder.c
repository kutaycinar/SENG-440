#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"

void buildTree(int asciiCodes[], struct node* node, int size, int currIndex) {

	// Condition for a leaf node
	if(currIndex * 2 + 2 >= size || asciiCodes[currIndex * 2 + 2] == 0) {
		node->symbol = asciiCodes[currIndex];
		return;
	}
	
	node->left = newNode(-1, 0);
	buildTree(asciiCodes, node->left, size, currIndex * 2 + 1);
	node->right = newNode(-1, 0);
	buildTree(asciiCodes, node->right, size, currIndex * 2 + 2);


}

int main(void) {
	
	setlocale(LC_ALL, "");

	FILE* file = fopen("encoded.txt", "r");
    
	// Read first line
	// Build huffman tree
    char huffmanInfo[5000];
	int treeAsciiCodes[512] = {};

	// TODO add tree size to file
	fgets (huffmanInfo, 100, file);
    char* tokenized = strtok(huffmanInfo, " ");
	int size = 0;
    while(tokenized != NULL) {
		treeAsciiCodes[size] = atoi(tokenized);
		tokenized = strtok(NULL, " ");
		size++;
	}
	for(int i = 0; i < size; i++){
		printf("%d ", treeAsciiCodes[i]);
	}
	struct node* huffmanTree = newNode(-1, 0);
	buildTree(treeAsciiCodes, huffmanTree, size - 1, 0);
	// printHuffmanTree(huffmanTree);

// 	// Read second line
// 	// Traverse huffman tree until leaf node is found
	char nextBit;
	printf("wtf\n");
	do {
		nextBit = fgetc(file);
		printf("%c", nextBit);
	} while(nextBit != EOF);
	
	
	fclose(file);
	 
}