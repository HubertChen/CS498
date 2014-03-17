# CS498 Python Exercise 8: Use regex to search and replace 
#
# Use regular expression to search and replace new line characters from
# the Linux system command 'fortune'
from subprocess import check_output
import re

fortune = check_output("fortune")

print re.sub(r"\n", "", fortune) 
