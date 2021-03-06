---
layout: post
title: "First thing I learned about working with Elixir"
date: 2015-06-30 13:16
categories: ["elixir"]
tags: ["elixir", "new-lang", "first-thing"]
source: http://elixir-lang.org
---

So, learning a new language, [Elixir]({{page.source}}), and after
installing it (a breeze, way easier than ruby), I start up the Elixir
REPL, IEx, type a few bon mots and then I'm stuck trying to quit the
thing.


{% highlight sh %}
$ iex
Erlang/OTP 18 [erts-7.0] [source] [64-bit] [smp:2:2] [async-threads:10] [kernel-poll:false]

Interactive Elixir (1.0.5) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> 40+2
42
iex(2)> "hello"<>"world"
"helloworld"
iex(3)> quit
** (RuntimeError) undefined function: quit/0

iex(3)> exit
** (RuntimeError) undefined function: exit/0

iex(3)> # Tried several things here: Ctrl-C, Ctrl-D, finally read
        # about Ctrl-G and tried that, giving me the switch command:
User switch command
 --> ?
  c [nn]            - connect to job
  i [nn]            - interrupt job
  k [nn]            - kill job
  j                 - list all jobs
  s [shell]         - start local shell
  r [node [shell]]  - start remote shell
  q                 - quit erlang
  ? | h             - this message
 --> q

$ # and out!
{% endhighlight %}


Fun stuff, but it did panic me a little as the normal things I tried
didn't work.

I don't quite understand why Ctrl-C wasn't working, perhaps because of
the prior two errors? I haven't been able to reproduce it
subsequently, so even more likely I was just fatfingering the keyboard
and missing the Ctrl-C.
