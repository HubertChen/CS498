# Count word lengths using a dictionary
import sys 

count = {};
for word in sys.stdin: 
	wordlen = len(word) - 1 

	# See if the key wordlen already exists in the dictionary
	if(count.has_key(wordlen)):
		count[wordlen] += 1
	else:
		count[wordlen] = 1

for i in count.keys(): 
	print '%i: %i' % ( i, count[i])
