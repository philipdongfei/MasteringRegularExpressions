# Extended Introductory Examples

## About the Examples

### A Short Introduction to Perl

## Matching Text with Regular Expressions

### Toward a More Real-World Example

### Side Effects of a Successful Match

### Intertwined Regular Expressions

#### A short aside--metacharacters galore

#### Non-Capturing Parentheses:(?:...)

#### Generic "whitespace" with \s

### Intermission

1. Most tools have their own particular flavor of regular expressions.
2. Perl can check a string in a variable against a regex using the construct `$variable =~ m/regex/`.
3. The concept of metacharacters -- characters with special interpretations -- is not unique to regular expressions.
4. Among the more useful shorthands that Perl and many other flavors of regex provide (some of which we haven't seen yet) are:
    `\t`    a tab character
    `\n`    a newline character
    `\r`    a carriage-return character
    `\s`    matches any "whitespace" character(space, tab, newline, formfeed, and such)
    `\S`    anything not `\s`
    `\w`    `[a-zA-Z0-9_]` (useful as in `\w+`, ostensibly to match a word)
    `\d`    `[0-9]`, i.e., a digit
    `\D`    anything not `\d`, i.e., `[^0-9]`
5. The `/i` modifier makes the test case-insensitive.
6. The somewhat unsightly `(?:...)` non-capturing parentheses can be used for grouping without capturing.
7. After a successful match, Perl provides the variables `$1`, `$2`, `$3`, etc., which hold the text matched by their respective `(...)` parenthesized subexpressions in the regex.

## Modifying Text with Regular Expressions

The similar construct `$var =~ s/regex/replacement/` takes it a step further: if the regex is able to match somewhere in the string held by `$var`, the text actually matched is replaced by *replacement*.

`$var =~ s/\bJeff\b/Jeffrey/;`

### Example: Form Letter

### Example: Prettifying a Stock Price

### Automated Editing

Here's all I did to make all the changes I needed: 
    % `perl -p -i -e 's/sysread/read/g' file`



### A Small Mail Utility

#### A Sample Email Message

#### A warning About .*

#### Real-world problems,real-world solutions

### Adding Commas to a Number with Lookaround

#### Lookaround doesn't "consume" text

#### A few more lookahead examples

#### Back to the comma exaple...

`
    $pop = 298444215;
    $pop =~ s/(?<=\d)(?=(?:\d\d\d)+$)/,/g;
    print "The US population is $pop\n";

`

indeed prints "The US population is 298,444,215" as we desire. It might, however, seem a bit odd that the parentheses surrounding `\d\d\d` are capturing parentheses. Here, we use them only for grouping, to apply the plus to the set of three digits, and so don't need their capture-to-$1 functionality.



#### Word boundaries and negative lookaround

For our comma problem, though, we really need only `(?!\d)` to cap our sets of three digits. We use that instead of `\d` or `$`, which leaves us with:
`
    $text =~ s/(?<=\d)(?=(\d\d\d)+(?!\d))/,/g;
`

This now works on text like "...tone of 12345Hz," which is good, but unfortunately it also matches the year in "... the 1970s ..." Actually, any of these match "... in 1970 ...," which is not good.


#### Commafication without lookbehind

` $text =~ s/(\d)(?=(\d\d\d)+(?!\d))/$1,/g; `
` $text =~ s/(\d)((\d\d\d)+\d)/$1,/g; `

### Text-to-HTML Conversion

#### Cooking special characters

`
    $text =~ s/&/&amp;/g; # Make the basic HTML...
    $text =~ s/</&lt;/g;    # ...character&,<,and>...
    $text =~ s/>/&gt;/g;    # ...HTML safe.

`

It's important to convert & first, since all three have '&' in the replacement.



#### Separating paragraphs

Luckily, most regex-endowed languages give us an easy solution, and *enhanced line anchor* match mode in which the meaning of ^ and $ to change from *string* related to the *logical-line* related meaning we need for this example. With Perl, this mode is specified with the `/m` modifier:
` $text =~ s/^&/<p>/mg;`

we use ` $text =~ s/^\s*$/<p>/mg; `

#### "Linkizing" an email address



#### Matching the username and hostname

So, we probably should use `[a-zA-Z0-9]`, or perhaps `[a-z0-9]` with the /i modifier (for a case-insensitive match). Hostnames can also have a dash as well, so we'll use `[-a-z0-9]`(again, being careful to put the dash first). This leaves us with `[-a-z0-9]+(\.[-a-z0-9]+)*\.(com|edu|info)` for the hostname part.

That's why I'll now introduce the /x modifier, which allows us to rewrite that regex as:
`
$text =~ s{
    \b
    # Capture the address to $1...
    (
        username regex
        \@
        hostname regex
    )
    \b
}{<a href="mailto:$1">$1</a>}gix;
`
The /x modifier appears at the end of that snippet (along with the /g and /i modifiers), and does two simple but powerful things for the regular expression. First, it causes most whitespace to be ignored, so you can "free-format" the expression for readability. Secondly, it allows comments with a leading \#.

#### Putting it together

` $text =~ s/^\s*$/<p>/mg;`

All the regular expressions work with the same multiline string, but notice that only the expression to separate paragraphs requires the /m modifier, since only that expression has `^` or `$`. Using /m on the others wouldn't hurt (well, except to make the reader wonder why it was there).


#### "Linkizing" an HTTP URL

#### Building a regex library

#### Why '$' and '@' sometimes need to be escaped

### That Doubled-Word Thing

#### Moving bits around: operators, functions, and objects

