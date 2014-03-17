# Exercise 4: String length
#
# See if strings of standard input are 'chomped' by Python. Try the string len() method and rstrip() method
import sys

for line in sys.stdin:
	sys.stdout.write(line)
	#print "Length: " + str(len(line))
	print len(line)
	line = line.rstrip()
	print len(line)
