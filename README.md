# Advent of Code 2020 ... in Rego!

This is an experiment to see how far Rego can get in the [Advent of Code](https://adventofcode.com/).

# Day 1

Just compute the cross-product and be done with it. The second part took approximately 30 seconds to finish as the cross-product contains about 1M elements. This is a situation where the interpretive overhead becomes a problem.

# Day 2

Nothing special here though this is probably the first time someone has defined a function called `xor` in Rego! It would have been nice to have a built-in function to count the number of substring occurrences.