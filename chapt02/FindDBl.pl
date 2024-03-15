$/ = ".\n";     # Sets a special "chunk-mode"; chunks end with a period-newline combination
while (<>)
{
    next unless s{  # (regex starts here)
        ### Need to match one word:
        \b              # Start of word....
        ( [a-z]+ )      # Grab word, filling $1(and \1).

        ### Now need to allow any number of spaces and/or<TAGS>
        (               # Save what intervenes to $2.
            (?:         # (Non-capturing parents for grouping the alternation)
                \s          # Whitespace (includes newline,which is good).
               |            # -or-
                <[^>]+>     # Item like<TAG>.
            )+          # Need at least one of the above, but allow more.
        )

        ### Now match the first word again:
        (\1\b)      # \b ensures not embedded. This copy saved to $3.
    #(regex ends here)
    }
    # Above is the regex. The replacement string is below, followed by the modifiers,/i,/g,and /x
    {\e[7m$1\e[m$2\e[7m$3\e[m}igx;  # $1 and $3 represent matches of the same word 
    s/^(?:[^\e]*\n)++//mg;      # Remove any unmarked lines.
    s/^/$ARGV: /mg;             # Ensure lines begin with filename.
    print;
}
