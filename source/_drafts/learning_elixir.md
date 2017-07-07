---
layout: post
title: "Learning Elixir"
categories: ["elixir"]
tags: [elixir, learning, reading, programming, language]

---

Notes and thoughts while learning elixir.

*******

* OOP: state and behaviour
* FP: pipelines and transforms

*******

> If we want, we can make these functions run in parallel—Elixir has a
> simple but powerful mechanism for passing messages between them. And
> these are not your father’s boring old processes or threads—we’re
> talking about the potential to run millions of them on a single
> machine and have hundreds of these machines interoperating. Bruce
> Tate commented on this paragraph with this thought: “Most
> programmers treat threads and processes as a nec- essary evil;
> Elixir developers feel they are an important simplification.” As we
> get deeper into the book, you’ll start to see what he means.
> <footer><cite>Programming Elixir, p. 3</cite></footer>


*******

> There are several ways of exiting from iex—none are tidy. The
> easiest two are typing `Ctrl-C` twice or typing `Ctrl-G` followed by
> `q` and `Return`.
> <footer><cite>Programming Elixir, p. 4</cite></footer>

*******

Install `alchemist.el` in my emacs to work with elixir stuff.
[tonini/alchemist.el](https://github.com/tonini/alchemist.el)

*******

**pattern matching**

`=` is **not** the assignment operator, it is the *match operator*.

This is the key to **pattern matching**.

{% highlight elixir %}
{:ok, status, message} = {:ok, 200, "hello world"} #=> {:ok, 200, "hello world"}
status #=> 200
message #=> "hello world"
{% endhighlight %}

The value 200 is *assigned* to the variable `status`. The value "hello
world" is *assigned* to the variable `message`.

`a = 1` is only sort of *incidently* like an assignment
statement. It's still pattern matching, the assignment happens via the
pattern match.

*******

**immutability**

> GOTO was evil because we asked "How did I get to this point of
> execution?". Mutability leaves us with "How did I get to this
> state?" - @jessitron
> <footer><cite>Programming Elixir, p. 20</cite></footer>

> In a functional language, we always transform data. We never modify
> it in place. The syntax reminds us of this every time we use it.
> <footer><cite>Programming Elixir, p. 22</cite></footer>

*******

**tuples** -- an *ordered* collection of values.

*******

[Style Guide](https://github.com/niftyn8/elixir_style_guide)

*******


{% highlight elixir %}
pttl = fn {a, b} -> [a, b] end
ptty.({3, 4}) #=> [3, 4]
{% endhighlight %}



[Note on Exercise: Functions-1](https://forums.pragprog.com/forums/322/topics/Exercise:%20Functions-1)

In the above exercise, saying `ptty.({8,7})` did something unexpected,
and output `'\b\a'` -- the answer is that lists of numbers that map to
printable characters are shown as strings. To fix:


    iex> IEx.configure [inspect: [char_lists: false]]
