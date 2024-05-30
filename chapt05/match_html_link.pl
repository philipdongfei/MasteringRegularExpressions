
$filename = "/home/philip/LearnDemo/Mastering_Regular_Expressions/chapt05/html_text.txt";
my $Html;
open(my $fh, '<', $filename) or die "cannot open file $filename";
{
    local $/;
    $Html = <$fh>;
}
close($fh);

#Note: the regex in the while(...) is overly simplistic
while ($Html =~ m{<a\b([^>]+)>(.*?)</a>}ig)
{
    my $Guts = $1;
    my $Link = $2;

    if ($Guts =~ m{
                    \b HREF
                    \s* = \s*
                    (?:
                      "([^"]*)"
                      |
                      '([^']*)'
                      |
                      ([^'">\s]+)
                    )
        }xi)
    {
        my $Url = $+;
        print "$Url with link text: $Link\n";
    }
}
