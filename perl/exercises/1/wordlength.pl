# wordlength.pl
#
# Find the number of occurrences of each word lenght in english.sorted. That is, find and print number of words in english.sorted that are one character long, two characters long, three characters long and so on.
#
# 1 - Read each line (word) form english.sorted
# 2 - Get length of each word that we read
# 3 - Increment the word length array element that corresponds to the length of each word
# 4 - Print word length array elements.

while($input = <STDIN>){
	my $length = length($input) - 1; # -1 to exclude the "\n" in $input
	$wordLengths[$length]++; 
}

print "Length\tNumber of words\n";

for(my $x = 1; $x < $#wordLengths; $x++){
	#If array is not initialized, sets the value to 0.
	if(!defined $wordLengths[$x]){
		$wordLengths[$x] = 0;
	}

	print $x . "\t" . $wordLengths[$x] . "\n";
}
