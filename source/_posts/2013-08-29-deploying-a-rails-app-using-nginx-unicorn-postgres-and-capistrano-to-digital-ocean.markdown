---
layout: post
title: "Deploying a Rails app using Nginx, Unicorn, Postgres, and Capistrano to Digital Ocean"
description: "A very concise tutorial on combining the given technologies to quickly deploy a Rails application."
date: 2013-08-29
categories: [swaac]
tags: [devops, rails, nginx, postgres, postgresql, unicorn, digital-ocean, ubuntu, capistrano, deployment, tutorials]
source: https://coderwall.com/p/yz8cha/deploying-rails-app-using-nginx-unicorn-postgres-and-capistrano-to-digital-ocean
saved_link: http://tt.imageshare.s3.amazonaws.com/clippings/saved_pages/deploying-a-rails-app-using-nginx-unicorn-postgres-and-capistrano-to-digital-ocean.html

---
{{ page.description }}

**NOTE:** THIS TUTORIAL IS REALLY OUT OF DATE

**LINK:** [{{page.source}}]({{page.source}})

## review / summary

The first part of the tutorial is all about setting up a deployment user and ruby / rails environment
on a digital ocean droplet. This is good stuff, and should be useful regardless of whether you're
doing a rails deploy or some other sort of deployment.

The key thing to look at here are the nginx, unicorn, and postgres configurations. These can be used
on other servers besides digital ocean's, and they make for good reading and understanding
of how these technologies relate.

Using capistrano as the standard tool for deploying rails makes sense, once you have this
whole thing set up. There are things you can probably do to make the capistrano deploy
simpler as well.

Ultimately, actual deployment in a true devops sense would be done using puppet or chef, but
for the initiate, this is a good start.
