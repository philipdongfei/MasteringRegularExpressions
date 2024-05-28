#$regex = '"(\\.|[^"])*+';
$regex = '(?>(\\.|[^"])*)"';
#$regex = '"([^"]|(?<=\\)")*"'; # error
while ($line = <>) {
    if ($line =~ m/$regex/) 
    #if ($line =~ m/"([^"]|(?<=\\)")*"/) 
    {
        print "match float:  $line";
    }
}
