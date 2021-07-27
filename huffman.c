#include "huffman.h"
#include <stdlib.h>
#include <stdio.h>

struct node* newNode(int symbol, int freq)
{
	// Allocate memory for new node
	node* node = (struct node*)malloc(sizeof(struct node));

	// Assign symbol to this node
	node->symbol = symbol;
	node->freq = freq;

	// Initialize left and right children as NULL
	node->left = NULL;
	node->right = NULL;

	return node;
}


/* Print nodes at a current level */
void printCurrentLevel(struct node* root, int level)
{
    if (root == NULL)
        return;

    if (level == 1)
        printf("%d ", root->symbol);

    else if (level > 1)
    {
        printCurrentLevel(root->left, level-1);
        printCurrentLevel(root->right, level-1);
    }
}

/* Function to print level order traversal a tree*/
void printHuffmanTree(struct node* root)
{
    int h = height(root);
    int i;
    for (i=1; i<=h; i++)
        printCurrentLevel(root, i);
} 

/* Print nodes at a current level */
void writeCurrentLevel(struct node* root, int level, FILE** outputFile)
{
    if (root == NULL)
        return;

    if (level == 1)
        fprintf(*outputFile, "%d ", root->symbol);

    else if (level > 1)
    {
        writeCurrentLevel(root->left, level-1, outputFile);
        writeCurrentLevel(root->right, level-1, outputFile);
    }
}

/* Function to print level order traversal a tree*/
void writeHuffmanTree(struct node* root, FILE** outputFile)
{
    int h = height(root);
    int i;
    for (i=1; i<=h; i++)
        writeCurrentLevel(root, i, outputFile);
} 
 
/* Compute the "height" of a tree -- the number of
    nodes along the longest path from the root node
    down to the farthest leaf node.*/
int height(struct node* node)
{
    if (node==NULL)
        return 0;
    else
    {
        /* compute the height of each subtree */
        int lheight = height(node->left);
        int rheight = height(node->right);
 
        /* use the larger one */
        if (lheight > rheight)
            return(lheight+1);
        else return(rheight+1);
    }
}
