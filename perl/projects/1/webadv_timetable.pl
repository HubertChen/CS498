# Perl Project 1: Retrieve Web Advisor Course Timetable
#
# Group Members: Hubert Chen and Josh Siemanowicz
#
# Command Line Arguments:
#	[0] Term 	: Which term/semester the class is in (e.g., '14/SP - Spring 2014').
#	[1] Subject 	: Which subject the class is in (e.g., 'COMPUTER SCIENCE').
#	[2] --help 	: Displays a help screen and sample usages
#	[3] --subjects 	: Displays a list of currently available subjects
#	[4] --terms 	: Displays a list of currently available terms

use strict;
use warnings;
use LWP::Simple;
use WWW::Mechanize;
use feature("switch");

my $website  = "http://www2.monmouth.edu/muwebadv/wa3/search/SearchClasses.aspx"; # MU course search web address
my $htmlCode = get($website); # Pulls HTML source code

given($ARGV[0]){
	when("--help")		{help();}
	when("--terms")		{terms();}
	when("--subjects")	{subjects();}
	default			{main();}
}

sub help{
	# Reads in a file, 'help.txt', and displays the file contents to the command line
	my $fileName = "help.txt";
	open(my $helpFile, "<", $fileName)
		or die("Unable to locate the help.txt file");

	while(my $line = <$helpFile>){
		print $line;
	}

	close($helpFile)
		or die("Unable to close help.txt file");
}

sub main{
	# Uses the WWW:Mechanize agent to fill out class search form and prints the HTML source code of
	# resulting search
	my $mech = WWW::Mechanize->new;

	$mech->get($website);
	$mech->set_fields("ddlTerm", $ARGV[0]);
	$mech->set_fields("ddlSubj_1", $ARGV[1]);
	$mech->click("btnSubmit");

	print $mech->content;
}

sub subjects{
	# Extracts first occurrence of HTML tags containing subject names
	$htmlCode =~ /<td class="left oddrow"><select name="ddlSubj_1" id="ddlSubj_1">((.|\n)*?)<\/select>/; 

	# Loops through each HTML tag and prints the subject
	my @subjects = split(/\n/, $1);
	print "\n";
	foreach my $line(@subjects){
		if($line =~ />(.*?)</){
			print "$1\n" if($1 ne "");
		}
	}
	print "\n";
}

sub terms{
	# Extracts first occurrence of HTML tags containing terms
	$htmlCode =~ /<td class="right"><select name="ddlTerm" id="ddlTerm">((.|\n)*?)\/select>/;

	# Loops through each HTML tag and prints the term
	my @terms = split(/\n/, $1);
	print "\n";
	foreach my $line(@terms){
		if($line =~ />(.*?)</){
			print "$1\n" if($1 ne "");
		}
	}
	print "\n";
}
