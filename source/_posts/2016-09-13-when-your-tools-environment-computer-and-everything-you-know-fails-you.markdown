---
layout: post
title: "When your tools, environment, computer, and everything you know fails you"
date: 2016-09-13 22:23
categories: ["day-in-the-life"]
tags: []

---

This post is one of frustration after a day of struggling with my
tools, the project environment, my computer, and bashing my head
against a problem. I'm calling this day "Trampled by Yaks".

I have been working on Rails applications for a long time. I've worked
on them starting back in 2007, and have been doing them pretty
steadily for the past several years. I've gone from working on
projects on the host machine, usually OSX, but sometimes Ubuntu
GNU/Linux as well. I've used tools such as RVM, rbenv, and
chruby. I've used Vagrant and VirtualBox. I've tried out Docker. None
of these have presented real problems for me.

But today, things just collided. I was working on my current gig,
trying to get an understanding of how things needed to work for a
particular feature (EPS Thumbnails in case anyone's interested in
that). However, I kept running into very strange problems.

A particular file was getting prematurely truncated, causing the
entire operation to fail. This didn't happen to anyone else on the
team, nor was it happening in staging or production. The other two
developers work directly on their company-provided macbooks. As a
contractor, I'm responsible to provide my own hardware. There are
differences in how we approach development. As this machine is my
personal machine, with all my own projects, photos, music and so on, I
don't particularly want to contaminate it or jeopardize these things
with work projects. This is why I use Vagrant as my development and
test environments.

Things weren't working. Even rolling everything back to the `develop`
branch, what I was trying to do was failing in this one, repeatable
way.

The key parts:

* host machine, a macbook pro 13" retina, with 8G of RAM, Intel i5 2
core processor.

* started out with VirtualBox 5.0.6, upgraded to 5.0.26

* started out with Vagrant 1.7.6, upgraded to 1.8.5

* Centos 7 virtual maching, started with a box created by the project,
ended with the "centos/7" official hashicorp box.

* ImageMagick version was 6.9.1-10 (Q16 x86_64 2015-07-26)

* Ghostscript version was 9.07

The odd behaviour was not detected by any of our tests, which all
passed while running on my VM. Even casual GUI-based interaction with
the sample test files worked fine. But when given another file, in
particular a PDF file, the operations for thumbnailing completely
b0rk3d.

My colleagues and I found examples of similar failures, but trying the
fixes proferred proved fruitless.

While attempting to upgrade the various pieces, also, I ran into huge
problems getting things to work. There were permission errors,
download errors, and I even found a copy of vagrant in a place I was
not expecting.

The struggle went on all day.

By the end, I had decided to dump anything to do with VMs, VirtualBox,
and Vagrant on this project. As my colleagues were able to develop on
OSX, I went that route as well.

Installing the necessary software at this point was trivial: Ruby,
Rails, MongoDB, ImageMagick, and Redis were already installed, just
needed to be upgraded. That was really the extent of the dependencies.

After that, things worked as expected. Only 9.5 hours into the day.

I have no learnings from this yet, and no forward solutions at this
point except to keep plugging. I never did yet figure out what was
causing the problem in the first place.

Perhaps I really need to invest in a work-only computer, so I can
treat it like shit without worrying about breaking my own things.

Code on.


*******

Links that helped out today:

* [How to: "Upload" from a local file · carrierwaveuploader/carrierwave Wiki](https://github.com/carrierwaveuploader/carrierwave/wiki/How-to:-%22Upload%22-from-a-local-file)

* [Vagrant: Warning: Authentication failure. Retrying · Issue #4839 · mitchellh/vagrant](https://github.com/mitchellh/vagrant/issues/4839#issuecomment-71487954)

* [VirtualBox Guest Additions ISO Download? (Petr Dvorak)](https://blogs.oracle.com/joshis/entry/virtualbox_guest_additions_iso_download)

* [How to Mount CDROM Media on CentOS 5/CentOS 6/CentOS 7](http://www.ehowstuff.com/how-to-mount-cdrom-media-on-centos-6-2/)
