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



### The Great Escape

## Expanding the Foundation

### Linguistic Diversification

### The Goal of a Regular Expression

### A Few More Examples

#### Variable names


#### A string within double quotes

#### Dollar amount (with optional cents)

#### An HTTP/HTML URL

#### Time of day, such as "9:17am" or "12:30pm"

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

## Personal Glimpses




