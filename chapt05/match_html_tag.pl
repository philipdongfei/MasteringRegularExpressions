
#$regex = '"(\\.|[^"])*+';
#$regex = '"([^"]|(?<=\\)")*"'; # error
while ($line = <>) {
    if ($line =~ m/<("[^"]*"|'[^']*'|[^'">])*>/) 
    {
        print "match float:  $line";
    }
}
