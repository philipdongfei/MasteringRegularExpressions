# Overview of Regular Expression Features and Flavors

## Regular Expressions and Cars

## In This Chapter

## A Casual Stroll Across the Regex Landscape



### The Origins of Regular Expressions

#### Grep's metacharacters

#### Grep evolves

#### Egrep evolves

#### Other species evolve

#### POSIX--An attempt at standardization

#### Henry Spencer's regex package

#### Perl evolves

#### A partial consolidation of flavors

#### Versions as of this book

### At a Glance

## Care and Handling of Regular Expressions

### Integrated Handling

### Procedural and Object-Oriented Handling

#### Regex handling in Java

##### A procedural example

#### Regex handling in VB and other .NET language

#### Regex handling in PHP

#### Regex handling in Python

#### Why do approaches differ?

### A Search-and-Replace Example

#### Search and replace in Java

#### Search and replace in VB.NET

#### Search and replace in PHP

### Search and Replace in Other Languages

#### Awk

#### Tcl

#### GNU Emacs

### Care and Handling: Summary

## Strings, Character Encodings, and Modes

### Strings as Regular Expressions

#### Strings in Java

#### Strings in VB.NET

#### Strings in C#

#### Strings in PHP

#### Strings in Python

#### Strings in Tcl

#### Regex literals in Perl

### Character-Encoding Issues

#### Richness of encoding-related support


### Unicode

#### Characters versus combining-character sequences

#### Multiple code points for the same character

#### unicode 3.1+ and code points beyond U+FFFF

#### Unicode line terminator

### Regex Modes and Match Modes

#### Case-insensitive match mode

#### Free-spacing and comments regex mode

#### Dot-matches-all match mode (a.k.a.,"single-linemode")

#### Enhanced line-anchor match mode(a.k.a., "multiline mode")

#### Literal-text regex mode

## Common Metacharacters and Features

### Character Representations

#### Character shorthands

#### These are machine dependent?

#### Octal escape-\num

#### Hex and Unicode escapes:\xnum,\x{num},\unum,\Unum,...

#### Control characters:\cchar

### Character Classes and Class-Like Constructs

#### Normal classes:[a-z] and [^a-z]

#### Almost any character:dot

#### Dot versus a negated character class

#### Exactly one byte

#### Unicode combining character sequence:\X

#### Class shorthands:\w,\d,\s,\W,\D,\S

### Anchors and Other "Zero-Width Assertions"

#### Start of line/string:^,\A

#### End of line/string:$,\Z,\z

#### Start of match(or end of previous match):\G

##### End of previous match, or start of the current match?

##### Advanced Use of\G with Perl

#### Word boundaries:\b,\B\<,\>,...

#### Lookahead (?=...);(?!...);Lookbehind,(?<=...),(?<!...)

### Comments and Mode Modifiers

#### Mode modifier:(?modifier), such as (?i) or (?-i)

#### Mode-modified span:(?modifier:...),such as (?i...)

#### Comments:(?#...) and #...

#### Literal-text span:\Q...\E

### Grouping, Capturing, Conditionals, and Control

#### Capturing/Grouping Parentheses:(...) and \1,\2,...

#### Grouping-only Parentheses:(?:...)

#### Named capture:(?<Name>...)

#### Atomic grouping:(?>...)

#### Alternation:...|...|...

#### Conditional:(?if then | else)

##### Using a special reference to capturing parentheses as the test

##### Using lookaround as the test 

##### Other tests for the conditional

#### Greedy quantifiers:*,+,?,{num,num}

#### Intervals -{min,max} or \{min,max\}

#### Lazy quantifiers:*?,+?,??,{num,num}+

## Guide to the Advanced Chapters








