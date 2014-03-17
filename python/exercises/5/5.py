import sys 

count = []
for word in sys.stdin: 
	wordlen = len(word) - 1 

	if wordlen >= len(count): 	
		for x in range (wordlen - len(count )): 
			count.append(0) 
		count.append(1) 
	else: 
		count[wordlen] += 1 
	
for i in range (1, len(count)): 
	print '%i: %i' % ( i, count[i])
