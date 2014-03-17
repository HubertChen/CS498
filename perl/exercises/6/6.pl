# Accepts and runs the following command line arguments:
# 	None
#		Display command usage along with an explanation of all other command line arguments
#	-help, --help, -h
#		Display command usage along with an explanation of all other command line arguments
#	-first, --first
#		Display the CS498 roster sorted by first name
#	-last, --last
# 		Display the CS498 roster sorted by last name
#	-sid, --sid
#		Display teh CS498 roster sorted by student ID
use strict;
use warnings;
use feature("switch");

given($ARGV[0]){
	when(/help/)	{help();}
	when(/first/)	{sortRoster("first");}
	when(/last/)	{sortRoster("last");}
	when(/sid/)	{sortRoster("sid");}
	default		{print "Wrong command line arugment";}
}

sub help{
	print "\nHelp:\n\n";
	print "Displays a sorted CS498 roster depending on the command line arguments\n\n";
	print "To see command line arguments, look inside 6.pl\n\n"; 
}

sub sortRoster{
	# Opens the CS498 Roster or exits
	my $fileName = "cs498roster";
	open(my $roster, "<", $fileName)
		or die("Unable to open file");

	# Saves each student into a hash
	my %list;
	while(my $line = <$roster>){
		# Parses the first name, last name, and student ID
		my @names = split(/, /, $line);
		my ($lastName, $firstName, $sid) = ($names[0], $names[1], $names[2]);
		chomp($sid);
		
		# Adds to the hash value depending argument
		if($_[0] eq "first")	{$list{$firstName} = $firstName." ".$lastName." ".$sid};
		if($_[0] eq "last")	{$list{$lastName}  = $firstName." ".$lastName." ".$sid};
		if($_[0] eq "sid")	{$list{$sid}	   = $firstName." ".$lastName." ".$sid};
	}

	# Prints hash
	foreach my $key(sort keys %list){
		print $list{$key}."\n";
	}

	close($roster);
}
