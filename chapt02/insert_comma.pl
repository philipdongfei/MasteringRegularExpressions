print "Enter a number: \n";
$input = <STDIN>; # This reads one line from the user.
chomp($input);    # This removes the ending newline from $input.

if ($input =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g) {
    print "$input\n";
}

$pop = 298444215;
$pop =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g;
print "The US population is $pop\n";

$text = "tone of 12345Hz, it is";
$text =~ s/(?<=\d)(?=(\d\d\d)+(?!\d))/,/g;
print "$text\n";
$text2 = "trends of the 1970s in the United States";
$text2 =~ s/(?<=\d)(?=(\d\d\d)+(?!\d))/,/g;
print "$text2\n";
print "Commafication without lookbehind\n";
$text = "tone of 182912345Hz, it is";
$text =~ s/(\d)(?=(\d\d\d)+(?!\d))/$1,/g;
print "$text\n";
$text = "28142190";
$text =~ s/(\d)((\d\d\d)+\d)/$1,$2/g;
print "$text\n";
$text = "28142190";
while ( $text =~ s/(\d)((\d\d\d)+\b)/$1,$2/g ) {
    # Nothing to do inside the body of the while--we merely want to reapply the regex until it fails
}
print "$text\n";

