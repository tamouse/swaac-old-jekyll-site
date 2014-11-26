---
layout: post
title: "<%= @title %>"
date: <%= Time.now.strftime("%Y-%m-%d %H:%M") %>
categories: [<%= Array(@categories).join(", ") %>]
tags: [<%= Array(@tags).join(", ") %>]
source: URL
---
