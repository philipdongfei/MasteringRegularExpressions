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

### Greediness and Laziness Always Favor a Match

### The Essence of Greediness,Laziness,and Backtracking

### Possessive Quantifiers and Atomic Grouping

#### Atomic grouping with (?>...)

##### The essence of atomic grouping

###### Some states may remain

###### Faster failures with atomic grouping

#### Possessive Quantifiers,?+,*+,++,and {m,n}+

#### The Backtracking of Lookaround

##### Mimicking atomic grouping with positive lookahead

#### Is Alternation Greedy?

#### Taking Advantage of Ordered Alternation

##### Ordered alternation pitfalls

##### A Few Ways to Slice and Dice a Date

## NFA,DFA, and POSIX

### "The Longest-Leftmost"

#### Really,the longest

### POSIX and the Longest-Leftmost Rule

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


