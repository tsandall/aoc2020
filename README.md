# Advent of Code 2020 ... in Rego!

This is an experiment to see how far Rego can get in the [Advent of Code](https://adventofcode.com/).

# Day 1

Just compute the cross-product and be done with it. The second part took approximately 30 seconds to finish as the cross-product contains about 1M elements. This is a situation where the interpretive overhead becomes a problem.

# Day 2

Nothing special here though this is probably the first time someone has defined a function called `xor` in Rego! It would have been nice to have a built-in function to count the number of substring occurrences.

# Day 3

After turning the input into a grid, we can find all the tree positions by iterating over the rows and using simple algebra to calculate the column index.

# Day 4

The logic to validate the passport records is concise and readable. Moreover, given the helper rules for the solution, interesting ad-hoc queries could be implemented without much effort. The nature of the problem is a great fit for Rego (similar to Day 1).

# Day 5

This one was more fun. I didn't immediately make the connection between the characters and the binary representation of the row/column number (e.g., "RLR" => 101 => 5). I ended up encoding the rows and columns into trees and then mapping the characters to lookups in the tree. In retrospect, the binary representation is obvious.

# Day 6

Similar to Day 1, once the input was parsed the solution fell out immediately. Initially the input was parsed into nested sets however that produced an incorrect answer when multiple groups (from the input) had the same responses. The fix was to simply parse the input into an array (of sets of sets.)

# Day 7

Finally, recursion. Part 1 is handled with `graph.reachable`. However, Part 2 calls for a recursive function that calculates the number of bags contained (transitively) within each bag. Since we cannot construct a nested object of arbitrary depth, we cannot use `walk`. Graph traversal built-in functions would be useful here.

# Day 8

Alas, I can't see a clever trick for this one. I had to cheat and use `http.send` to recurse 😱. To run:

```
# turn off logging as it will be very loud
opa run -s day8/day8.rego -l=error
```

Then you can evaluate `part1` and `part2` to produce the answers. Part 2 takes about a minute to run.

# Day 9

The `array.slice` built-in function came in handy here as the rules can easily create the window of numbers to inspect. Part 2 took about a minute to return on my machine. Given the size of the cross-product (~1M elements), this is not surprising.

# Day 10

More `http.send` trickery for Part 2. This time HTTP response caching was important for memoizing the results of the calculation.