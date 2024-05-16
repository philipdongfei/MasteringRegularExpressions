$f = "/usr/bin/perl";
$f =~ s{^.*/}{};
print "linux:", $f, "\n";
$w = "\\Program Files\\Yahoo!\\Messenger";
$w =~ s/^.*\\//;
print "win:", $w, "\n";
$WholePath = "/usr/local/bin/perl";
$WholePath =~ m{([^/]*)$}; # Check variable $WholePath with regex.
$FileName = $1;            # Note text matched
print "filename: ", $FileName, "\n";
$WholePath = "/usr/local/bin/perl";
$WholePath =~ m{^(.*)/([^/]*)$};
$LeadingPath = $1;
$FileName = $2;
print "leadingpath", $LeadingPath, "\n";
print "filename: ", $FileName, "\n";
print "Enter the Full Path:";
my $WholePath = <STDIN>;

if ( $WholePath =~ m!^(.*)/([^/]*)$! ) {
    # Have a match -- $1 and $2 are valid
    $LeadingPath = $1;
    $FileName = $2;
    print "leadingpath1: ", $LeadingPath, "\n";
    print "filename1: ", $FileName, "\n";
} else {
    # No match, so there's no '/' in the filename
    $LeadingPath = "."; # so "file.txt" looks like "./file.txt"("." is the current directory)
    $FileName = $WholePath;
    print "leadingpath2: ", $LeadingPath, "\n";
    print "filename2: ", $FileName, "\n";
}



