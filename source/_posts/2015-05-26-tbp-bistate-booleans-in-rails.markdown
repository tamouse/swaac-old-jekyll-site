---
layout: post
title: "TBP: Bistate Booleans in Rails"
date: 2015-05-26 10:32
categories: ["rails", "tbp"]
tags: ["tiny-best-practices", "tbp", "rails", "booleans", "bistate", "tristate"]
---

Sometimes, the default settings in a framework and associated tools
can lead to trouble. The boolean type in Rails is one such.

The `boolean` type specified in a database migration is represented
differently in different database management systems.

* Postgresql has a "real" boolean, althought it is actually a tristate
type.

* MySQL implements boolean as a tinyint, which allows 4 values.

* Sqlite3 implements boolean as an integer, which is way too many
values.

Rails comes along and tries to do the right thing in each of these
cases, but in almost all the above, we're still left with the
possibility of an undefined state, neither `true` nor `false`. In most
cases, this can be accomodated with "truthiness" and "falsiness", but
not always, as in the cases where you think you can apply a meaning to
`nil` and it whines at you.

In discussions various places, it seems there is no optimal solution
that works in all cases, but a common practice is to set both a
default value **and** disallow nulls in the field, like so:



{% highlight ruby %}
add_column :widgets, :frangible, :boolean, default: false, null: false
{% endhighlight %}

Thus making it clear(er) that `frangible` on the `Widget` model will
only be `true` or `false`, and if it isn't explicitly set, will be
`false` by default.

There are cases where tristate or multistate values are useful, but I
feel these should be explicit, perhaps using an `enum` if that's your
choice.
