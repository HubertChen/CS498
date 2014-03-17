# Run the system's 'fortune' command and store the output in a variable. Then print the contents of the variable
use strict;
use warnings;

my $fortuneCommand = `fortune`;
print($fortuneCommand);
