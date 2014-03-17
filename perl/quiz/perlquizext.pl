# Extra Credit for Perl Quiz
# 
# Description:
#	Takes a file containing a list of words that is new line delimited from the command line.
#	Prints all words that have repeated letters, regardless of case.
use strict;
use warnings;

# Loops through each line in the file
while(my $line = <>){
	# Regex that returns true if there are repeated letters, regardless of case
	if($line =~ /(\w)(\w)*\1{1,}/){
		print $line;
	}
} 
