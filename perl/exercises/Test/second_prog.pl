#chomp() function example

print "Enter a witty rejoinger, perferably \"Ha ha !\",\n";
$usercomment = <STDIN>;

chomp($usercomment);
$progcomment = "ha ha!";

print "The result of the comparison : ", $usercomment eq $progcomment;
