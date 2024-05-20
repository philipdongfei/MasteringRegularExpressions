$regex = '^-?([0-9]+(\.[0-9]*)?|\.[0-9]+)$';
while ($line = <>) {
    if ($line =~ m/$regex/) 
    {
        print "match float:  $line";
    }
}
