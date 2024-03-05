print "Enter a temperature in Celsius:\n";
$celsius = <STDIN>; # this reads one line from the user
chomp ($celsius);   # this removes the ending newline from $celsius

if ($celsius =~ m/^[-+]?[0-9]+(\.[0-9]*)?$/) {
    $fahrenheit = ($celsius * 9 / 5) + 32; # calculate Fahrenheit
    printf "%.2f C is %.2f F\n", $celsius, $fahrenheit;
} else {
    print "Exprecting a number, so I don't understand \"$celsius\".\n";
}
