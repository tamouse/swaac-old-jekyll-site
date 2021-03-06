---
layout: post
title: "Ledgard's Programming Proverbs"
date: 2015-08-28 21:17
categories: ["programming"]
tags: ["proverbs", "programming", "learning", "books"]
---
Back when I was coming up in university back in the mid-seventies, I
acquired a book called
[*Programming Proverbs for Fortran Programmers*][ppffp] which at the
time was the language I was learning as a young EE student. (The
switch to software engineering was a couple years out.) The book
turned out to be the seminal work in my learning about software
development, though I probably didn't realize it at the time.

Today, the books lists for a cool $85 on Amazon in its original
paperback form. The more generic version, just
[*Programming Proverbs*][ppamzn], can be had for pennies, apparently,
and is really worth having around. It uses languages like PL/1, Algol
and a few others. Nearly all structured C-based programming languages
are based originally upon Algol.

But the fact it uses archaic languages is not a detraction. The
strength lies in proverbs themselves. Though a few might be considered
implementation specific or truly anachronistic (#21 in particular will
have most of you laughing, I am sure), they all lend themselves quite
well to the modern programmer.

(On that #21: spending time looking over what you've written before
just blasting it through the interpretter can save some time for the
silly mistakes the syntax checker won't find. With rails startup
times, a mistake in the run time that you should have caught by
looking is just downright frustrating.)

I'm giving just the list of the proverbs here, with the hope of
providing a series expanding on a few of these.

# Programming Proverbs

> Programming Proverbs, Principles of Good Programming with Numerous
> Examples to Improve Programming Style and Proficiency

1. Define the problem completely.
2. Think first, program later.
3. Use the top-down approach.
4. Beware of other approaches.
5. Construct the program in logical units.
6. Use procedures.
7. Avoid unnecessary GOTO's.
8. Avoid side effects.
9. Get the syntax correct now, not later.
10. Use good mnemonic names.
11. Use intermediate variables properly.
12. Leave loop variables alone.
13. Do not recompute constants within a loop.
14. Avoid implementation-dependent features.
15. Avoid tricks.
16. Build in debugging techniques.
17. Never assume the computer assumes anything.
18. Use comments.
19. Prettyprint.
20. Provide good documentation.
21. Hand-check the program before running it.
22. Get the program correct before trying to produce good output.
23. When the program is correct, produce good output.
24. Reread the manual.
25. Consider another language.
26. Don't be afraid to start over.

<!-- ************************************************************ -->

[ppamzn]: http://www.amazon.com/Programming-Proverbs-Principles-Numerous-Proficiency/dp/0810455226/ref=sr_1_1 "Programming Proverbs"
[ppffp]: http://www.amazon.com/Programming-Proverbs-Programmers-programming-Paperback/dp/B011SIXBDU/ref=sr_1_2K "Programming Proverbs for Fortran Programmers"
