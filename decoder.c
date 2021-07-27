#include <stdio.h>
#include <stdlib.h>
#include <wchar.h>
#include <locale.h>
#include <string.h>
#include "huffman.h"

	 

int main(void) {
	
	char *locale = setlocale(LC_ALL, "");

	FILE* file = fopen("encoded.txt", "r");
		
    
	// Read first line
	// Build huffman tree
    char huffmanInfo[5000];
    char opcodes[5000];

	fgets (huffmanInfo, 100, file);
    char* test = strtok(huffmanInfo, " ");
    for(int i = 0; i < 5; i++) {
        printf("%c", test[i]);
    }



	// Read second line
	// Traverse huffman tree until leaf node is found


 	fclose(file);


	 
}