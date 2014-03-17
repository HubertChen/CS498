# Accepts command line arguments that alter the sort order of rosters

use strict;
use warnings;

my $rosterLine;
my $lastName;
my $firstName;
my $sid;
my $sort;
my %newRoster;

# Subroutine to display usage in responce to --help option
sub showhelp {
	print "Usage : 6.pl <option> filename1 filename2 ..\n\n";
	print "Options: \n";
	print " -h, -help, --help	: print usage\n";
	print " -last, --last		: sort roster by last name\n";
	print " -first, --first		: sort roster by first name\n";
	print " -sid, --sid		: sort roster by student id\n";
}

if($#ARGV == -1){
	showhelp();
}

my $arg0 = shift @ARGV;
if($arg0 =~ /last/){
	$sort = "last";
}
elsif($arg0 =~ /first/){
	$sort = "first";
}
else{
	$sort = "sid";
}

while(my $rosterline = <>){
	($lastName, $firstName, $sid) = split(/,/, $rosterline);

	if($sort eq "last"){
		my $key = join " ", ($lastName, $firstName);
		$newRoster{$key} = $sid;
	}

	if($sort eq "first"){	
		my $key = join " ", ($firstName, $lastName);
		$newRoster{$key} = $sid;
	}

	if($sort eq "sid"){
		my $value = join " ",($firstName, $lastName);
		$newRoster{$sid} = $value;
	}	
}

foreach my $student(keys %newRoster){
	print "$student\n";
}
