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

#### Word boundaries and negative lookaround

#### Commafication without lookbehind

### Text-to-HTML Conversion

#### Cooking special characters

#### Separating paragraphs

#### "Linkizing" an email address

#### Matching the username and hostname

#### Putting it together

#### "Linkizing" an HTTP URL

#### Building a regex library

#### Why '$' and '@' sometimes need to be escaped

### That Doubled-Word Thing

#### Moving bits around: operators, functions, and objects

