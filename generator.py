import random

# Requirement of 200 symbols
# First symbol 10% probability, then 9%, 8%, 7%, 6%
# After the first 5 all symbols are equally likely

symbols = range(1101,1106) #1131
probabilities = [10, 9, 8, 7, 6] #+ [60/195] * 195


ascii_codes = random.choices(symbols, weights=probabilities, k=1)
ascii_symbols = [chr(x) for x in ascii_codes]

# Print the table of symbol to code mappings
# for i in range(931,1131):
	# print(f"{i-930},{i},{chr(i)},{round(probabilities[i-931],5)}%")

# Populate a txt file with symbols
with open('output1.txt', 'w') as f:
	for item in ascii_symbols:
		mystr = ascii_symbols[0] + str(ascii_codes[0])
		print(mystr)
		f.write(mystr)