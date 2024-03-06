print "Enter a price:\n";
$input = <STDIN>;
chomp($input);
$input =~ s/(\.\d\d[1-9]?)\d*/$1/;
print "price: $input\n";
