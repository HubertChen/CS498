#Converts .25 to a float, multiplies by 4
print "0.25" * 4, "\n";

#Repetition operator (x)
print "Ba" . "na" x 4, "\n";

#Variable examples
$name = "fred";
print "My name is ", $name, "\n";

#Variable Scope example
$name = "fred";
print "My name is $name\n";

{
	my $name = "joe";
	print "My name is $name\n";
}

#Standard input
print "Please enter something interesting : \n";
$comment = <STDIN>;
print "You entered $comment\n";
