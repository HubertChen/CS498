# Print the words of length 7 or less in a specified file

while($word = <STDIN>){
	if(length($word) <= 8){ #account for \n character
		chomp($word);
		print($word . "\t" . length($word) . "\n");
	}
}
	
