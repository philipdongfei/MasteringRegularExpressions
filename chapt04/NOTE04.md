# The Mechanics of Expression Processing

## Start Your Engines!

### Two Kinds of Engines

### New Standards

#### The impact of standards

### Regex Engine Types

### From the Department of Redundancy Department

### Testing the Engine Type

#### Traditional NFA or not?

#### DFA or POSIX NFA?

## Match Basics

### About Examples

In fact, with all this chapter offers, I identify only two all-encompassing rules:

1. The match that begins earliest (leftmost) wins.
2. The standard quantifiers ('*', '+','?', and '{m,n}') are greedy.


### Rule 1: The Match That Begins Earliest Wins

This rule says that any match that begins earlier (leftmost) in the string is always preferred over any plausible match that begins later.

#### The "transmission" and the bump-along

#### The transmission's main work: the bump-along

### Engine Pieces and Parts

#### Literal text

#### Character classes, dot, Unicode properties, and the like

#### Capturing parentheses 

#### Anchors

#### No "electric" parentheses,backreferences, or lazy quantifiers

### Rule 2: The Standard Quantifiers Are Greedy

First, you need to know that the standard quantifiers (?, *, +, and {min,max}) are *greedy*.
To be clear, the standard quantifiers settle for something less than the maximum number of allowed matches *if they have to*, but they always attempt to match as many times as they can, up to that maximum allowed.


#### A subjective example 

#### Being too greedy

#### First come, first served

#### Getting down to the details

## Regex-Directed Versus Text-Directed

I call the gasoline-driven NFA engine "regex-dreicted", and the electric-driven DFA "text-directed."

### NFA Engine: Regex-Directed


#### The control benefits of an NFA engine

In essence, each subexpression of a regex in a regex-directed match is checked independently of the others.


### DFA Engine: Text-Directed

I call this "text-directed" matching because each character scanned from the text controls the engine.

### First Thoughts: NFA and DFA in Comparison

The two basic technologies behind regular-expression engines have the somewhat imposing names *Nondeterministic Finite Automaton* (NFA) and *Deterministic Finite Automaton* (DFA).

#### Consequences to us as users

Because of the regex-directed nature of an NFA, the details of how the engine attempts a match are very important.
It's the exact opposite with a DFA -- since the engine keeps track of all matches simultaneously, none of these differences in representation matter so long as in the end they all represent the same set of possible matches.
Three things come to my mind when describing a DFA engine:

- DFA matching is very fast.
- DFA matching is very consistent.
- Talking about DFA matching is very boring.


## Backtracking

The essence of an NFA engine is this: it considers each subexpression or component in turn, and whenever it needs to decide between two equally viable options, it selects one and remembers the other to return to later if need be.


### A Really Crummy Analogy

#### A crummy little example

### Two Important Points on Backtracking

In situations where the decision is between "make an attempt" and "skip an attempt," as with items governed by quantifiers, the engine always chooses to first *make* the attempt for *greedy*[^1] quantifiers, and to first *skip* the attempt for *lazy*(non-greedy)[^2] ones.

The most recently saved option is the one returned to when a local failure forces backtracking. They're used LIFO (last in first out).

[^1]: For every position in the string. Try to match the pattern at that position. If there's no match, go to the next position.
[^2]: The lazy mode of quantifiers is an opposite to the greedy mode. It means: "repeat minimal number of times".


### Saved States

In NFA regular expression nomenclature, the piles of bread crumbs are known as saved *states*. A state indicates where matching can restart from, if need be. It reflects both the position in the regex and the point in the string where an untried option begins.

#### A match without backtracking

#### A match after backtracking

#### A non-match

#### A lazy match

### Backtracking and Greediness


#### Star,plus,and their backtracking

#### Revisiting a fuller example

A few observations: first, backtracking entails not only recalculating our position within the regex and the text, but also maintaining the status of the text being matched by the subexpression with parentheses.

One final observation that may already be clear to you: something governed by star (or any of the greedy quantifiers) first matches as much as it can *without regard to what might follow in the regex*.

## More About Greediness and Backtracking


### Problems of Greediness

### Multi-Character "Quotes"


### Using Lazy Quantifiers

grep -oP '<B>((?!<B>).)*?</B>' test.txt
grep -oP '<B>((?! </?B>).)*</B>' test.txt

### Greediness and Laziness Always Favor a Match

$price =~ s/(\.\d\d[1-9]?)\d*/$1/;

I then noted:
    Anything matched so far is what we want to *keep*, so we wrap it in parentheses to capture to $1. We can then use $1 in the replacement string. If this is the only thing that matches, we replace exactly what was matched with itself--not very useful. However, we go on to match other items outside the $1 parentheses. They don't find their way to the replacement string, so the effect is that they're removed. In this case, the "to be removed" text is any extra digits, the `\d*` at the end of the regex.

Well, we know how to write "at least one digit"! Simply replace `\d*` with `\d+`:

$price =~ s/(\.\d\d[1-9]?)\d+/$1/;


### The Essence of Greediness,Laziness,and Backtracking

Whether greedily or lazily, *every possible path is tested before the engine admits failure*.

The order that the paths are tested is different between greedy and lazy quantifiers (after all, that's the whole point of having the two!), but in the end, if no match is to be found, it's known only after testing every possible path.


grep -oP '".*"' test1.txt # with the greedy star, selects the longest one
grep -oP '".*?"' test1.txt # with the lazy star, selects the shortest

### Possessive Quantifiers and Atomic Grouping

#### Atomic grouping with (?>...)

In essence, matching within `(?>...)` carries on normally, but if and when matching is able to exit the construct (that is, get past its closing parenthesis), all states that had been saved while within it are thrown away. In practice, this means that once the atomic grouping has been exited, whatever text was matched within it is now one unchangeable unit, to be kept or given back only as a whole. All saved states representing untried options within the parentheses are
eliminated, so backtracking can never undo any of the decisions made within (at least not once they're "locked in" when the construct is exited).

$price =~ s/(\.\d\d(?>[1-9]?))\d+/$1/;

##### The essence of atomic grouping

Atomic grouping, on the other hand, is fundamentally different because it actually *eliminates possible paths*. Eliminating states can have a number of different consequences, depending on the situation:

- **No Effect** If a match is reached before one of the eliminated states would have been called upon, there is no effect on the match.
- **Prohibit Match** The elimination of states can mean that a match that would have otherwise been possible now becomes impossible.
- **Different Match** In some cases, it's possible to get a *different* match due to the elimination of states.
- **Faster Failure** It's possible for the elimination of states to do nothing more than allow the regex engine, when no match is to be found, report that fact more quickly.

** Some states may remain.**
** Faster failures with atomic grouping.**


###### Some states may remain

###### Faster failures with atomic grouping

#### Possessive Quantifiers,?+,*+,++,and {m,n}+

#### The Backtracking of Lookaround


##### Mimicking atomic grouping with positive lookahead



#### Is Alternation Greedy?

Let's look at the Traditional NFA engine used in Perl, PHP, Java, .NET languages, and many others. When faced with alternation, each alternative is checked in the left-to-right order given in the expression.

`^(Subject|Date):`

*This is just another case of the regex engine backtracking to a point where untried options are still available.* This continues until an overall match is achieved, or until all options (in this case, all alternatives) are exhausted.

#### Taking Advantage of Ordered Alternation

##### Ordered alternation pitfalls

Consider matching a January date of the form 'Jan 31'.

`Jan ([12][0-9]|3[01]|0?[1-9])`
`Jan (31|[123]0|[012]?[1-9])`
`Jan (0[1-9]|[12][0-9]?|3[01]?|[4-9])`


##### A Few Ways to Slice and Dice a Date

## NFA,DFA, and POSIX

### "The Longest-Leftmost"

when the transmission starts a DFA engine from some particular point in the string, and there exists a match or matches to be found at that position, the DFA finds the longest possible match, period. Since it's the longest from among all possible matches that start equally furthest to the left, it's the "longest-leftmost" match.

#### Really,the longest

### POSIX and the Longest-Leftmost Rule

The POSIX standard requires that if you have multiple possible matches that start at the same position, the one matching the most text must be the one returned.


### Speed and Efficiency

#### DFA efficiency

#### NFA: Theory Versus Reality

### Summary: NFA and DFA in Comparison

#### DFA versus NFA: Differences in the pre-use compile

#### DFA versus NFA: Differences in match speed

#### DFA versus NFA: Differences in what is matched

#### DFA versus NFA: Differences in capabilities

#### DFA Speed with NFA Capabilities: Regex Nirvana?

#### DFA versus NFA: Differences in ease of implementation

## Summary


