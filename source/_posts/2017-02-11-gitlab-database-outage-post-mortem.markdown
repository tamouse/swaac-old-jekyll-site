---
layout: post
title: "Gitlab Database Outage Post-Mortem"
date: 2017-02-11 01:54
categories: ["devops"]
tags: ["devops", "gitlab", "database-outage", "post-mortem"]
source: https://about.gitlab.com/2017/02/10/postmortem-of-database-outage-of-january-31/
---

Back at the end of January 2017, git SaaS
provider [Gitlab](https://gitlab.com) reported a disaster of epic
proportions:

> On January 31st 2017, we experienced a major service outage for one of our products, the online service GitLab.com. The outage was caused by an accidental removal of data from our primary database server.

> This incident caused the GitLab.com service to be unavailable for many hours. We also lost some production data that we were eventually unable to recover. Specifically, we lost modifications to database data such as projects, comments, user accounts, issues and snippets, that took place between 17:20 and 00:00 UTC on January 31. Our best estimate is that it affected roughly 5,000 projects, 5,000 comments and 700 new user accounts. Code repositories or wikis hosted on GitLab.com were unavailable during the outage, but were not affected by the data loss. GitLab Enterprise customers, GitHost customers, and self-hosted GitLab CE users were not affected by the outage, or the data loss.

They had destroyed the database holding all their repository
information, and then could not find any viable backups.

**Today, 11 February 2017,** they released
a [post-mortem]({{ page.source }}) of the situation,
providing something few companies have *ever* done: transparency and
openness into a major devops disaster so that *everyone* can learn.

They list several items in the Root Cause Analysis section, and
provide a list of mitigation and recovery improvements now underway.



## Major kudos to Gitlab!
