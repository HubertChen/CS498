# CS498 Python Assignment 7: Read file as first command line argument
#
# When called with no command line args, then use a usage function to print a program usage statement
import sys

args = sys.argv

if(len(args) > 1):
	inputFile = open(args[1], "r")
	
	while 1:
		line = inputFile.readline()
		if(not line):
			break
		print line.rstrip() # Removes the new line character
