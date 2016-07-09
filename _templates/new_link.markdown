---
layout: link
title: "Link: <%= @title %>"
date: <%= Time.now.strftime("%Y-%m-%d %H:%M") %>
categories: <%= Array(@categories) %>
tags: <%= Array(@tags) %>
link:
  href: "<%= @url %>"
  title: "<%= @title %>"
  date: "<%= Time.now.strftime("%FT%T") %>"
  author:
    name: ""
    url: ""

---
