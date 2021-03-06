---
layout: post
title: "PP: Programming Proverbs, an Introduction"
date: 2017-07-23 12:24
categories: ["programming"]
tags: ["programming", "style", "proverbs", "craft", "improving"]

---

Back in 1975, Henry F. Ledgard published a small book called
"Programming Proverbs", a book of 26 best practices for programming,
using Algol 60 as the explanatory language. This was followed up with
"Pascal with Style: Programming Proverbs", which restated the
practices using Pascal as the language, which was the one I found and
read, since I was using Pascal at the time in University.

I read the book voraciously, small though it was. Ledgard's proverbs
were very apt, and I was pretty well interested in writing good
quality code even back then, not really wanting to settle for good
enough to pass the class.

Many years, decades even, have passed since that time, and I've found
many new authors to read, and have gotten great guidance from
them. And even so, that little book of proverbs has stuck in my head,
forming a real foundation from which to approach the craft of software
development.

I'm going to write a series of posts on these programming proverbs,
with the title tag "PP", and a tag of "proverbs" if you want to sort
them out later.

In this introduction, I'm going to list the proverbs. Subsequent posts
will go into more depth on them.

## The Proverbs

1. [Define the problem completely]({% link _posts/2017-07-29-pp-1-define-the-problem-completely.md %}).
2. [Think first, program later]({% link _posts/2017-07-29-pp-2-think-first-program-later.md %}).
3. [Use the top-down approach]({% link _posts/2017-08-20-pp-3-use-the-top-down-approach.markdown %}).
4. Beware of other approaches.
5. Construct the program in logical units.
6. Use procedures.
7. Avoid unnecessary GOTOs.
8. Avoid side effects.
9. Get the syntax right now, not later.
10. Use good mnenonic names.
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
21. Hand-check the programming before running it.
22. Get the program correct before trying to produce good output.
23. When the program is correct, produce good output.
24. Reread the manual.
25. Consider another language.
26. Don't be afraid to start over.

## Updating the proverbs

You many note some of those proverbs seem quite archaic in the world
of software development we are in today. How many people *ever* step
through their code by hand before subjecting it to the compiler /
interpretter / browser?

Also, with the rise of test-driven development, perhaps it's more
likely that your code will be running the moment you hit the "Save"
key.

Before you dismiss these, consider not just the time and practice of
the day (1975 is likely longer ago than most of my readers have been
alive). Consider, really, the intent: there is a reason for all of
these, and I'll be bring those ideas up to date as I cover them.

## Acknowledgements

I owe a *great* deal to Mr. Ledgard. I don't know if he's still with
us, but as a teacher of a very young and enthusiastic computer science
student back in the 1970's, he meant a lot. As I write these, I know I
would not be anywhere near the craftsperson I am with him.

As these works are no longer in print, I hope the spirit of sharing
these proverbs for helping new software developers acquire the
everyday skills of the craft will cause you to seek out these books,
in order to possibly get them updated and republished.
