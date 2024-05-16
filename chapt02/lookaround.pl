
while ($line = <>) {
    #if ($line =~ m/(?=Jeffrey)Jeff/){
    #    print "\'(?=Jeffrey)Jeff\': $line";
    #}    
    #if ($line =~ m/Jeff(?=rey)/) {
    #    print "\'Jeff(?=rey)\': $line";
    #}
    #if ($line =~ m/Jeff(?=Jeffrey)/) {
    #    print "\'Jeff(?=Jeffrey)\': $line";
    #}
    #if ($line =~ s/\bJeff(?=s\b)/Jeff'/g) {
    #    print "\'\\bJeff(?=s\\b)\': $line";
    #}
    #if ($line =~ s/(?<=\bJeff)(?=s\b)/'/g) {
    #    print "\'(?<=\\bJeff)(?=s\\b)\': $line";
    #}
    if ($line =~ m/(?=s\b)(?<=\bJeff)/'/g) {
        print "\'(?=s\\b)(?<=\\bJeff)\': $line";
    }
}
