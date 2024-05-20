$depth = 3;
$regex = '\(' . '(?:[^()]|\(' x $depth . '[^()]*' . '\))*' x $depth . '\)';
while ($line = <>) {
    if ($line =~ m/$regex/) 
    {
        print "match net: $line";
    }
}
