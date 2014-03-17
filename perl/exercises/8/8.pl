# Print the System's 'fortune' command in reverse order
use strict;
use warnings;

my @fortuneCommand = split(/\n/, `fortune`);
@fortuneCommand = reverse(@fortuneCommand);

foreach my $line(@fortuneCommand){
	print $line."\n";
}
