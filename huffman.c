#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>

#define MAX_INT 		2147483647
#define ALPHABET_SIZE	5
#define ALPHABET_OFFSET 931

// TODO: Remove this!!!!!!!!!
char lookupTable[200][200];

typedef struct opcode {
	char bit;
	struct opcode *next;
} opcode;

typedef struct node {
	int symbol;
	int freq;
	char opcode[200];
	struct node* left;
	struct node* right;
} node;

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



/* Function protoypes */
void printCurrentLevel(struct node* root, int level);
int height(struct node* node);

void printPreorder(struct node* node, char* buffer) {
    if (node == NULL)
        return;
		
	if (node->symbol != -1) {
		strcpy(lookupTable[node->symbol-ALPHABET_OFFSET], buffer);
	}
 
    /* first print data of node */
    printf("%d %s", node->symbol, node->opcode);

    /* then recur on left sutree */
	char buff2[200];
	strcpy(buff2, buffer);
    printPreorder(node->left, strcat(buff2, "0"));
    /* now recur on right subtree */
	char buff3[200];
	strcpy(buff3, buffer);
    printPreorder(node->right, strcat(buff3, "1"));
}
 
/* Function to print level order traversal a tree*/
void printLevelOrder(struct node* root)
{
    int h = height(root);
    int i;
    for (i=1; i<=h; i++)
        printCurrentLevel(root, i);
}
 
/* Print nodes at a current level */
void printCurrentLevel(struct node* root, int level)
{
    if (root == NULL)
        return;
    if (level == 1) {
        printf("%d ", root->symbol);
	}
    else if (level > 1)
    {
        printCurrentLevel(root->left, level-1);
        printCurrentLevel(root->right, level-1);
    }
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

int main(void)
{
	char *locale = setlocale(LC_ALL, "");

	// Open input file
	FILE *file = fopen("output20.txt", "r");

	int frequencies[ALPHABET_SIZE] = {0};

	wint_t c;

	// Increment symbol frequencies
	while ((c = fgetwc(file)) != WEOF)
	{
		frequencies[(int)c - ALPHABET_OFFSET] += 1;
	}

	// frequencies[200] = {0};
	// frequencies = {8, 3, 3, 3, 3};

	// Create an array that holds the leaf nodes
	node* treeNodes[ALPHABET_SIZE] = {};
	for(int i = 0; i < ALPHABET_SIZE; i++) {
		node* nextNode = newNode(i + ALPHABET_OFFSET, frequencies[i]);
		treeNodes[i] = nextNode;
		// wprintf(L"%i -> %lc -> %d\n", i, treeNodes[i]->symbol, treeNodes[i]->freq);
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
		// printf("\nsmallest: %d. Second smallest: %d\n", firstIndex, secondIndex);
		node* nodeParent = newNode(-1, smallest + secondSmallest);

		nodeParent->right = treeNodes[firstIndex];
		nodeParent->left = treeNodes[secondIndex];

		treeNodes[firstIndex] = nodeParent;
		treeNodes[secondIndex]->freq = -1;
		nodesLeft--;
	}


	printLevelOrder(treeNodes[0]);
	char buffer[200];
	printPreorder(treeNodes[0], buffer);

	// printf("")

	// pre order traversel and store results into array

	// TO DO:
	// encode huffman tree and opcodes into file
	// decoder
	// run this on ARM machine to ensure it works
	// optimize


	fclose(file);

	return EXIT_SUCCESS;
}