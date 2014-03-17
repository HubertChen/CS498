# Print all Uppercase words
#
# Description:
#	Takes a file containing a list of words that is new line delimited from the commmand line. 
#	Prints all the words that begin with an uppercase letter
use strict;
use warnings;

# Loops through each line in the file
while(my $line = <>){
	# Regex that returns true if there is capital letter at the beginning of the line
	if($line =~ /^([A-Z])/){
		print $line;
	}
}
