# Introduction to Regular Expressions

## Solving Real Problems

I gave a simple command to display the **From:** and **Subject:** line from each message. To tell *egrep* exactly which kinds of lines I wanted to see, I used the regular expression `^(From|Subject):`.

## Regular Expressions as a Language

### The Filename Analogy

but in general, **this powerful pattern language and the patterns themselves are called regular expressions.**

### The Language Analogy

## The Regular-Expression Frame of Mind

### If You Have Some Regular-Expression Experience

### Searching Text Files: Egrep

## Egrep Metacharacters

### Start and End of the Line

### Character Classes

#### Matching any one of serveral characters

#### Negated character classes

`egrep 'q[^u]' word.list`

Remember, a negated character class means "match a character that's not listed" and not "don't match what is listed." These might seem the same, but the **Iraq** example shows the subtle difference. A convenient way to view a negated class is that it is simple a shorthand for a normal class that includes all possible characters *except* those that are listed.

> Don't feel too bad because of the trick question. Let me assure you that had *egrep* not automatically stripped the newlines (many other tools don't strip them), or had **Iraq** been followed by spaces or other words or whatnot, the line would have matched. It is important to eventually understand the little details of each tool, but at this point what I'd like you to come away with from this exercise is that *a character class, even negated, still requires a character to match.*

### Matching Any Character with Dot

### Alternation

#### Matching any one of several subexpressions

### Ignoring Differences in Capitalization

### Word Boundaries

You can use the (perhaps odd looking) *metasequences* `\<` and `\>` if your version happens to support them.
If you wanted, you could use `\<cat` or `cat\>` to find words starting and ending with **cat**.



### In a Nutshell

|Metacharacter  | Name      | Matches   |
| ------        |  ----     | -----     |
| .             | dot       | any one character |
| \[\.\.\.\]         | character class | any character listed |
| \[^\.\.\.\]        | negated character class | any character not listed |
| ------- | ------- | ---------- |
| ^       | caret   | the position at the start of the line |
| $       | dollar  | the position at the end of the line |
| \\\<    | backslash less-than | the position at the start of a word |
| \\\>    | bachslash greater-than | the position at the end of a word |
| ------- | ------- | ---------- |
| \|      | or; bar | matches either expression it separates |
| \(\.\.\.\) | parentheses | used to limit scope of '|', plus additional uses yet to be discussed |


### Optional Items

The metacharacter **?** (*question mark*) means *optional*.

`July? (fourth|4(th)?)`

### Other Quantifiers: Repetition

|    | Minimum Required | Maximum to Try | Meaning |
|:---:| :----:        | :-------:       | ------  |
| ?  | none    | 1    | one allowed; none required("one optional") |
| *  | none    | no limit | unlimited allowed; none required("any amount OK") |
| +  | 1 | no limit | unlimited allowed; one required("at least one") |


#### Making a Subexpression Optional

#### Defined range of matches: intervals

Some versions of *egrep* support a metasequence for providing your own minimum and maximum: `...{min,max}`. This is called the *interval* quantifier.

### Parentheses and Backreferences

I used a version of egrep that didn't supports both `\<...\>` and backreferencing.


### The Great Escape

## Expanding the Foundation



### Linguistic Diversification

### The Goal of a Regular Expression

### A Few More Examples

#### Variable names

`[a-zA-Z_][a-zA-Z_0-9]*`
`[a-zA-Z_][a-zA-Z_0-9]{0,31}`


#### A string within double quotes

A simple solution to matching a string within double quotes might be: 
`"[^"]*"`

#### Dollar amount (with optional cents)

One approach to matching a dollar amount is: `\$[0-9]+(\.[0-9][0-9])?`
But, if you need to find lines that contain just a price, and nothing else, you can wrap the expression with `^\$[0-9]+(\.[0-9][0-9])?$`

#### An HTTP/HTML URL

Putting these all together, we might use as our first attempt something like:
    `% egrep -i '\<http://[-a-z0-9_.:]+/[-a-z0-9_:@&?=+,.!/~*%$]*\.html?\>' files` 

Heck, I could probably get away with even something as simple as:
    `% egrep -i '\<http://[^ ]*\.html?\>' files...`

#### Time of day, such as "9:17am" or "12:30pm"

12-hour time
`(1[012]|[1-9]):[0-5][0-9] (am|pm)`

24-hour time
`(2[0-3]|1[0-9]|0?[0-9]):[0-5][0-9]`
`(2[0-3]|[01]?[0-9]):[0-5][0-9]`
`[01]?[4-9]|[012]?[0-3]`

### Regular Expression Nomenclature

#### Regex

#### Matching

#### Metacharacter

#### Flavor

#### Extending the Time Regex to Handle a 24-Hour Clock

#### Subexpression

#### Character

### Improving on the Status Quo

### Summary

|           Items to Match a Single Character       |
|    Metacharacter              Matches             | 
|.      | dot   | Matches any one character         |
|[...]  | character class | Matches any one character listed |
|[^...] | negated character class | Matches any one character not listed |
|\cbar  | escaped character | When cbar is a metacharacter, or the escaped combination is not otherwise special, matches the literal char |
|  Items Appended to Provide "Counting": The Quantifiers |
| ?    | question | One allowed, but it is optional |
| *    | star     | Any number allowed, but all are optional |
| +    | plus     | At least one required; additional are optional |
| {min,max} | specified range | Min required, max allowed |
|  Items That Match a Position  |
| ^    | caret    | Matches the position at the start of the line |
| $    | dollar   | Matches the position at the end of the line |
| \\\<   | word boundary | Matches the position at the start of a word |
| \\\>   | word boundary | Matches the position at the end of a word |
|       Other    |
| |    | alternation   | Matches either expression it separates |
|(...) | parentheses   | Limits scope of alternation, provides grouping for the quantifiers, and "captures" for backreferences |
|\1, \2,...| backrefernce | Matches text previously matched within first, second, etc., set of parentheses. |
|    not supported by all versions of egrep |


## Personal Glimpses




