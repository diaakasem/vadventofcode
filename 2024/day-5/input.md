# [Advent of Code](/)

- [\[About\]](/2024/about)
- [\[Events\]](/2024/events)
- [\[Shop\]](https://cottonbureau.com/people/advent-of-code)
- [\[Log In\]](/2024/auth/login)

# 0.0.0.0: [2024](/2024)

- [\[Calendar\]](/2024)
- [\[AoC++\]](/2024/support)
- [\[Sponsors\]](/2024/sponsors)
- [\[Leaderboard\]](/2024/leaderboard)
- [\[Stats\]](/2024/stats)

Our [sponsors](/2024/sponsors) help make Advent of Code possible:

[Kotlin by JetBrains](/2024/sponsors/redirect?url=https%3A%2F%2Fkotl%2Ein%2Flang%2Daoc) \- Ho-ho-hold on to your code! Unwrap coding fun with Advent of Code in Kotlin – tackle daily puzzles, watch our livestreams for tips, and join our merry community. Wishing you happy coding and warm holidays! kotl.in/aoc2024

## \-\-\- Day 3: Mull It Over ---

"Our computers are having issues, so I have no idea if we have any Chief Historians in stock! You're welcome to check the warehouse, though," says the mildly flustered shopkeeper at the [North Pole Toboggan Rental Shop](/2020/day/2). The Historians head out to take a look.

The shopkeeper turns to you. "Any chance you can see why our computers are having issues again?"

The computer appears to be trying to run a program, but its memory (your puzzle input) is _corrupted_. All of the instructions have been jumbled up!

It seems like the goal of the program is just to _multiply some numbers_. It does that with instructions like `mul(X,Y)`, where `X` and `Y` are each 1-3 digit numbers. For instance, `mul(44,46)` multiplies `44` by `46` to get a result of `2024`. Similarly, `mul(123,4)` would multiply `123` by `4`.

However, because the program's memory has been corrupted, there are also many invalid characters that should be _ignored_, even if they look like part of a `mul` instruction. Sequences like `mul(4*`, `mul(6,9!`, `?(12,34)`, or `mul ( 2 , 4 )` do _nothing_.

For example, consider the following section of corrupted memory:

```
x<em>mul(2,4)</em>%&mul[3,7]!@^do_not_<em>mul(5,5)</em>+mul(32,64]then(<em>mul(11,8)mul(8,5)</em>)
```

Only the four highlighted sections are real `mul` instructions. Adding up the result of each instruction produces `<em>161</em>` ( `2*4 + 5*5 + 11*8 + 8*5`).

Scan the corrupted memory for uncorrupted `mul` instructions. _What do you get if you add up all of the results of the multiplications?_

To play, please identify yourself via one of these services:

[\[GitHub\]](/auth/github) [\[Google\]](/auth/google) [\[Twitter\]](/auth/twitter) [\[Reddit\]](/auth/reddit)\- [\[How Does Auth Work?\]](/about#faq_auth)

