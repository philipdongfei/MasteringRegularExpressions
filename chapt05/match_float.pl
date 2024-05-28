$regex = '^-?([0-9]+(\.[0-9]*)?|\.[0-9]+)$';
#$regex = '-?[0-9]*\.?[0-9]*'; # error
while ($line = <>) {
    if ($line =~ m/$regex/) 
    {
        print "match float:  $line";
    }
}
