# Print the words of length 7 or less in a specified file using regular expression

while($word = <STDIN>){
	if($word =~ /^.{1,7}$/){ #account for \n character
		chomp($word);
		print($word . "\t" . length($word) . "\n");
	}
}
	
