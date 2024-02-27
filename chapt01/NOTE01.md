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




