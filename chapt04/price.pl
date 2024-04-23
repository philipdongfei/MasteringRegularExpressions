print "Enter a price:\n";
$price = <STDIN>;
chomp($price);

#$price =~ s/(\.\d\d[1-9]?)\d*/$1/;
#$price =~ s/(\.\d\d[1-9]?)\d+/$1/;
$price =~ s/(\.\d\d(?>[1-9]?))\d+/$1/;
printf "price: %f\n", $price;
