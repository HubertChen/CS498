# Create a hash value array with the Students full name as a key
# and their student ID as their value 

#Loops through each line in the standard input
while($line = <>){
	#Using split()	
	@names = split /, /, $line;
	$key = join " ", ($names[1], $names[0]);
	$nameArray{$key} = $names[2];
}

# Print %newroster hash using its keys:
foreach my $student(keys %nameArray){
	print $student . " " . $nameArray{$student};
}

