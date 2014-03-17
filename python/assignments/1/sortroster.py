# CS498: Python Assignment, Question 3
# 
# Description:
# 	Read each line of the cs498roster into a list, swapping the first
#	name and last name in the process, and sort the array by first name
import re

rosterFile = open("cs498roster", "r") # READ only
roster = []

# Save each student by: {firstName} {lastName} {studentID}
for line in rosterFile:
	# Splits each line by the ", " delimiter
	pattern = re.compile(r", ")
	lineParts = pattern.split(line)
	roster.append("%s%s %s" % (lineParts[1], lineParts[0], lineParts[2]))

# Sorts the roster by first name then prints
roster.sort()
for line in roster:
	print line
