# $ perl -w text2html.pl text2html.txt
undef $/;   # Enter "file-slurp" mode
$text = <>; # Slurp up the first file given on the command line.

$text =~ s/&/&amp;/g;   # Make the basic HTML...
$text =~ s/</&lt;/g;    # ...characters&,<,and>...
$text =~ s/>/&gt;/g;    # ...HTML safe.

$text =~ s/^\s*$/<p>/mg;    # Separate paragraphs.

$HostnameRegex = qr/[-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info)/i;
# Turn email addresses into links...
$text =~ s{
    \b
    # Capture the address to $1...
    (
        \w[-.\w]*                                   # username
        \@
        $HostnameRegex # hostname
    )
    \b
}{<a href="mailto:$1">$1</a>}gix;

# Turn HTML URLs into links...
$text =~ s{
    \b
    # Capture the URL to $1...
    (
        http:// $HostnameRegex \b           # hostname
        (
            / [-a-z0-9_:\@&?=+,.!/~*'%\$]* # Optional path
            (?<![.,?!])                     # Not allowed to end with [.,?!]
        )?
    )
}{<a href="$1">$1</a>}gix;

print $text; # Finally,display the HTML-ized text.

