#include <stdlib.h>
#include <stdio.h>

#ifndef __HUFFMAN__H
#define __HUFFMAN__H

#define MAX_INT 		2147483647
#define ALPHABET_SIZE	5
#define FILENAME "output20.txt"
#define ALPHABET_OFFSET 931

typedef struct node {
	int symbol;
	int freq;
	struct node* left;
	struct node* right;
} node;

struct node* newNode(int symbol, int freq);

void printCurrentLevel(struct node* root, int level);

int height(struct node* node);

void printHuffmanTree(struct node* root);

struct node* buildHuffmanTree(short frequencies[]);

#endif