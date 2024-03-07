print "Enter a number: \n";
$input = <STDIN>; # This reads one line from the user.
chomp($input);    # This removes the ending newline from $input.

if ($input =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g) {
    print "$input\n";
}
