# CS498: Python Assignment, Question 2
# 
# Description:
#	Create a 10 element Python list of short fortunes (<80 characters) from
#	the Linux 'fortune' command through command line substitution. Print 
#	the 10 list elements in the following format:
#
#	#1. {fortune}
#	#2. {fortune}
#	...
#	#10. {fortune}
from subprocess import check_output
import re

fortuneList = []

# Adds a fortune to the fortuneList list
for x in range(0, 10):
	fortuneList.append(check_output(["fortune", "-n80", "-s"]))

# Substitutes new line characters and tabs with a space; then, prints the
# fortune in the specified format
for x in range(0, len(fortuneList)):
	print "\n\t#%d. %s" % (x + 1, re.sub(r"\n|\t", "", fortuneList[x])) 
print "\n"
