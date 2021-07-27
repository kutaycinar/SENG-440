#ifndef __HUFFMAN__H
#define __HUFFMAN__H

#define MAX_INT 		2147483647
#define ALPHABET_SIZE	5
#define ALPHABET_OFFSET 931

typedef struct node {
	int symbol;
	int freq;
	struct node* left;
	struct node* right;
} node;

struct node* newNode(int symbol, int freq);

#endif