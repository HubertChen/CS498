# Takes in a the CS498 class roster then outputs the first name and last
# name of each student. 

$count = 0;

#Loops through each line in the standard input
while($line = <STDIN>){
	#Using regex
	#$line =~ /^([a-zA-Z0-9_ ]+), ([a-zA-Z0-9_ .]+), (\w+)$/;
	#$nameArray[$count] = "$2 $1\n";
	#$count++;

	#Using split()	
	@names = split /, /, $line;
	$nameArray[$count] = $names[1] . $names[0] . "\n";
	$count++;
}

print sort(@nameArray);
