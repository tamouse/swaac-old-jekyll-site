---
layout: post
title: "PP 3: Use the Top-Down Approach"
date: 2017-08-20 12:01
categories: ["programming"]
tags: ["programming", "proverbs", "top-down"]

---

Ledgard's 3rd Proverb is "Use the Top-Down Approach", which means to
design our code in levels, from most abstract to most detailed.

-----

[Programming Proverbs Introduction]({% link _posts/2017-07-23-pp-introduction.markdown %})

-----

It builds on the first two proverbs directly, and introduces the idea
of *postponement of details* by making *abstractions*, which are
*successively refined*.

This approach tends to favour the imperative (aka procedural) sort of
coding and can be useful in object-oriented programming. It's perhaps
less useful in functional programming, but it still makes sense
conceptually that we'll know a lot more about the big pieces of
something when we start than the details of implementation.

Top-down also lends itself very well to the Test-/Behavior-Driven
development approach, as we should be testing and verifying each
level as we go along.

On the other hand, it creates a need for a lot of mocking of
unimplemented code, which can create overblown test suites for no
apparent gain. Keep the mocks minimal and only to the point of testing
the logic of the level under test and don't attempt to build
integration tests at first.

Another advantage is that the top-down approach is helpful in keeping
our modules, classes, functions, procedures, and methods small. It
allows us to focus on just what's important at this level of
abstraction.

When creating our initial levels, it's often helpful to write them
out in human language as comments. This can often help us derive
useful names for variables and methods, and to write the test
statements to be filled in as well.


### example: ATM

Most of us are familiar with an automated teller machine (ATM). If our
task was to write an interface, in a top-down approach, we might start
with this:

```
loop
  accept card
  validate customer

  loop
    gather request
    process request
    break loop if customer is finished

  return card
```

and then refine each step. Taking just "process request" step from
above:

```
when request is a
  deposit: process deposit
  withdrawal: process withdrawal
  balance check: process balance check
  purchase stamps: process stamp purchase
```

(Some ATMs do a lot more than that, but you get the picture.)

Being able to just write out the algorithm in plain human language
helps us to keep
to
[proverb 2: think first, program later]({% link _posts/2017-07-29-pp-2-think-first-program-later.md %}).
