#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"

struct node buildTree(int* asciiCodes[], struct node* node, int size, int currIndex) {

	// Condition for a leaf node
	if(currIndex * 2 + 2 >= size) {
		node->symbol = asciiCodes[currIndex];
		return;
	}
	
	node->left = buildTree(&asciiasciiCodes, newNode(-1, 0), size, currIndex * 2 + 1)
	node->right = buildTree(&asciiasciiCodes, newNode(-1, 0), size, currIndex * 2 + 2)


}

int main(void) {
	
	char *locale = setlocale(LC_ALL, "");

	FILE* file = fopen("encoded.txt", "r");
    
	// Read first line
	// Build huffman tree
    char huffmanInfo[5000];
    char opcodes[5000];
	int treeAsciiCodes[512] = {};

	fgets (huffmanInfo, 100, file);
    char* tokenized = strtok(huffmanInfo, " ");
	int size = 0;
    while(tokenized != NULL) {
		treeAsciiCodes[size] = atoi(tokenized);
		tokenized = strtok(NULL, " ");
		size++;
	}
	struct node* huffmanTree = newNode(-1, 0);
	buildTree(huffmanTree, &treeAsciiCodes, size, 0);
	// Build Huffman tree
	// Use array indexes to find children
	// Probably should be recursive
	
	




	// Read second line
	// Traverse huffman tree until leaf node is found


 	fclose(file);


	 
}