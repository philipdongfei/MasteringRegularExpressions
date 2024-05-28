# Practical Regex Techniques

## Regex Balancing Act

Writing a good regex involves striking a balance among several concerns:

- Matching what you want, but only what you want
- Keeping the regex manageable and understandable
- For an NFA, being efficient (creating a regex that leads the engine quickly to a match or a non-match, as the case may be)

## A Few Short Examples
### Continuing with Continuation Lines

`^\w+=([^\n\\]|\\.)*`

### Matching an IP Address

#### Know your context

### Working with Filenames

#### Removing the leading path from a filename


#### Accessing the filename from a path

#### Both leading path and filename

### Matching Balanced Sets of Parentheses

To match the parenthesized expression part, you might consider the following regular expressions, among others:

1. \(.*\)       literal parentheses with anything in between
2. \([^)]*\)    from an opening parenthesis to the next closing parenthesis
3. \([^()]*\)   from an opening parenthesis to the next closing
                parenthesis, but no other opening parentheses allowed in
                between


The real problem is that on the vast majority of systems, *you simply can't match arbitrarily nested constructs with regular expressions*.
But, even without these special constructs, you can still build a regex to match things nested to *a certain depth*, but not to an *arbitrary level* of nesting.

But, here's a little Perl snippet that, given a **$depth**, creates a regex to match up to that many levels of parentheses beyond the first. It uses Perl's "*string x count*" operator, which replicates *string* by *count* times:
`$regex = '\(' . '(?:[^()]|\(' x $depth . '[^()]*' . '\))*' x $depth . '\)';`

### Watching Out for Unwanted Matches

His regex is `-?[0-9]*\.?[0-9]*`.
Look at the regex closely--*everything* is optional. *If* a number is there, and *if* it is at the beginning of the string, it is matched, but *nothing is required*. This regex can match all three non-number examples, matching the nothingness at the beginning of the string each time.

`^-?([0-9]+(\.[0-9]*)?|\.[0-9]+)$`
### Matching Delimited Text

Matching a double-quoted string and matching an IP address are just two examples of a whole class of matching problem that often arises: the desire to match text delimited (or perhaps separated) by some other text.

- Matching a C comment, which is surrounded by '/*' and '*/'.
- Matching an HTML tag 
- Extracting items between HTML tags.
- Matching a line in a *.mailrc* file.
- Matching a quoted string, but allowing it to contain quotes if they are escaped.
- Parsing CSV (comma-separated values) files.

In general, the requirements for such tasks can be phrased along the lines of:

>1. Match the opening delimiter.
>2. Match the main text
    (which is really "match anything that is not the closing delimiter").
>3. Match the closing delimiter.

#### Allowing escaped quotes in double-quoted strings

An important lession to take from this example is:
> When backtracking can cause undesired matches in relation to alterna-
> tion, it's likely a sign that any success is just a happenstance due to the 
> ordering of the alternatives.

In fact, had our original regex had its alternatives reversed, it would match incorrectly in *every* string containing an escaped double quote. The problem is that one alternative can match something that is supposed to be handled by the other.

This example shows a particularly important moral:
> Always consider the "odd" cases in which you *don't* want a regex to
> match, such as with "bad" data.


### Knowing Your Data and Making Assumptions

There is nothing wrong with making assumptions about your data, or how you intend a regex to be used. The problems, if any, usually lie in overly optimistic assumptions and in misunderstandings between the author's intentions and how the regex is eventually used. Documenting the assumptions can help.

### Stripping Leading and Trailing Whitespace

By far the best all-around solution is the simple use of two substitutions:
`s/^\s+//;`
`s/\s+$//;`

## HTML-Related Examples

### Matching an HTML Tag

### Matching an HTML Link

### Examining an HTTP URL 

### Validating a Hostname

### Link Checker in VB.NET

### Plucking Out a URL in the Real World

## Extended Examples

### Building Up a Regex Through Variables in Java

## Keeping in Sync with Your Data

### Keeping the match in sync with expectations

### Maintaining sync after a non-match as well

### Maintaining sync with \G

### This example in perspective

## Parsing CSV Files

### Distrusting the bump-along

### CSV Processing in Java

### One change for the sake of efficiency

### Other CSV formats

### CSV Processing in VB.NET

