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

### Watching Out for Unwanted Matches

### Matching Delimited Text

#### Allowing escaped quotes in double-quoted strings

### Knowing Your Data and Making Assumptions

### Stripping Leading and Trailing Whitespace

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

