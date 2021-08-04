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

    // if (level == 1)
        // printf("%d ", root->symbol);

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

struct node* buildHuffmanTree(short frequencies[]) {
    // Create an array that holds the leaf nodes
	node* treeNodes[ALPHABET_SIZE] = {};
	for(int i = 0; i < ALPHABET_SIZE; i++) {
		node* nextNode = newNode(i + ALPHABET_OFFSET, frequencies[i]);
		treeNodes[i] = nextNode;
	}
	
	int nodesLeft = ALPHABET_SIZE;
	while(nodesLeft > 1) {
		int firstIndex = 0, secondIndex = 0;
		int smallest = MAX_INT;
		int secondSmallest = MAX_INT;
		for(int i = 0; i < ALPHABET_SIZE; i++) {
			int nextFreq = treeNodes[i]->freq;
			if(nextFreq == -1) {continue;}
			if(nextFreq < smallest) {
				firstIndex = secondIndex;
				secondIndex = i;
				secondSmallest = smallest;
				smallest = nextFreq;
			} else if(nextFreq < secondSmallest) {
				secondSmallest = nextFreq;
				firstIndex = secondIndex;
				secondIndex = i;
			}

		}
		node* nodeParent = newNode(-1, smallest + secondSmallest);

		nodeParent->right = treeNodes[firstIndex];
		nodeParent->left = treeNodes[secondIndex];

		treeNodes[firstIndex] = nodeParent;
		treeNodes[secondIndex]->freq = -1;
		nodesLeft--;
	}
    // Return the root of the tree
    return treeNodes[0];
}