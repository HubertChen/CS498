#Regular expression example

$hubert = "fred-flinstone";

if($hubert =~ /(\w+)-(\w+)$/){
	print "true\n";
}
else{
	print "false\n";
}
