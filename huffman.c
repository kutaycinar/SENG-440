#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>

#define MAX_INT 	2147483647

typedef struct node
{
	int symbol;
	int freq;
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

void pa_int(int *array, int length)
{
	for (int i = 0; i < length; i++)
	{ 
		printf("%d -> %d\n",i, array[i]);
	}
}

int main(void)
{
	char *locale = setlocale(LC_ALL, "");

	// Open input file
	FILE *file = fopen("output20.txt", "r");

	int frequencies[200] = {0};

	wint_t c;

	// Increment symbol frequencies
	while ((c = fgetwc(file)) != WEOF)
	{
		frequencies[(int)c - 931] += 1;
	}

	// Create an array that holds the leaf nodes
	node* treeNodes[200] = {};
	for(int i = 0; i < 200; i++) {
		node* nextNode = newNode(i + 931, frequencies[i]);
		treeNodes[i] = nextNode;
		// wprintf(L"%i -> %lc -> %d\n", i, treeNodes[i]->symbol, treeNodes[i]->freq);
	}
	
	int nodesLeft = 200;
	while(nodesLeft > 1) {
		int firstIndex = 0, secondIndex = 0;
		int smallest = MAX_INT;
		int secondSmallest = MAX_INT;
		for(int i = 0; i < 200; i++) {
			int nextFreq = treeNodes[i]->freq;
			if(nextFreq == -1) {continue;}
			if(nextFreq <= smallest) {
				firstIndex = secondIndex;
				secondIndex = i;
				secondSmallest = smallest;
				smallest = nextFreq;
			} else if(nextFreq < secondSmallest) {
				secondSmallest = nextFreq;
				firstIndex = i;
			}
		}
		// printf("\nsmallest: %d. Second smallest: %d\n", firstIndex, secondIndex);
		node* nodeParent = newNode(-1, smallest + secondSmallest);
		nodeParent->left = treeNodes[firstIndex];
		nodeParent->right = treeNodes[secondIndex];
		treeNodes[firstIndex] = nodeParent;
		treeNodes[secondIndex]->freq = -1;
		nodesLeft--;
	}

	// for (int  i = 0; i <)
	printf("%d\n", treeNodes[0]->freq);


	fclose(file);

	return EXIT_SUCCESS;
}