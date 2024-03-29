
while ($line = <>) {
    if ($line =~ m/^\s*$/ ) {
        last;
    }
    if ($line =~ m/^Subject: (.*)/i) {
        $subject = $1; 
    }
    if ($line =~ m/^Date: (.*)/i) {
        $date = $1;
    }
    if ($line =~ m/^Reply-To: (.*)/i) {
        $reply_address = $1;
    }
    if ($line =~ m/^From: (\S+) \(([^()]*)\)/i) {
        $reply_address = $1;
        $from_name = $2;
    }
}

if ( not defined($reply_address)
    or not defined($from_name)
    or not defined($subject)
    or not defined($date) )
{
    die "couldn't glean the required information!";
}
print "To: $reply_address ($from_name)\n";
print "From: jfriedl\@regex.info (Jeffrey Friedl)\n";
print "Subject: Re: $subject:\n";
print "\n" ; 
print "on $date $from_name wrote:\n";

while ($line = <>) {
    print "|> $line";
}

