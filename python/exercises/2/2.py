# Exercise 2
#
# Question: Does just a plain 'print' statement work instead of 'sys.stdout.write'?
# Answer: No, print includes a new line character at the end of the print statement
import sys

for line in sys.stdin:
	print line

