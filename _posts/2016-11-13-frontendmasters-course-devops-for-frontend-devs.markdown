---
layout: post
title: "FrontendMasters Course: DevOps for Frontend Devs"
date: 2016-11-13 12:52
categories: ["class"]
tags: ["frontendmasters", "devops", "jemyoung"]
source: URL
---

On November 11, 2016, I attended
the [FrontendMasters](https://frontendmasters.com){:target="_blank"}
course "DevOps for Frontend Devs" taught
by [Jem Young](https://jemyoung.com/about/){:target="_blank"} from
Netflix.

It was a great class. Here's the checklist I built for bringing up a
basic droplet on [Digital Ocean](https://digitalocean.com){:target="_blank"}

## create an ssh key pair

-   you cna reuse one you already have, or create a new one

## create a new server

-   [ ] create a droplet on DO
-   [ ] copy and save the new droplet's IP address
    -   [ ] add to /etc/hosts to make it easy
-   [ ] upload the PUBLIC key you created or are reusing
-   [ ] log into the new droplet: `ssh -i $HOME/.ssh/id_rsa
        root@$NEW_IP`

## on the new server, as root

-   [ ] Change root password to something you know (DO set's it to
    something randome and never tells you what it is.)
    -   [ ] `passwd`
-   [ ] `apt-get update` to refresh DPKG indexes
-   [ ] `apt-get install -y htop` nice top() replacement
-   [ ] add user `tamara`:
    -   [ ] `adduser tamara`
    -   [ ] `usermod -aG sudo tamara`
-   [ ] add new user `git`
    -   [ ] `adduser git`
    -   [ ] `usermod -aG sudo git`

## back on the home machine

-   [ ] move public key to users
    -   Users: [tamara, git]

            cat ~/.ssh/is_rsa.pub | ssh $USERa@$NEW_SERVER 'mkdir -p .ssh && cat >> .ssh/authorized_keys

## on new server, regular user (from now on)

-   Disable access via `ssh` for `root`
    -   [ ] `sudo vi /etc/ssh/sshd_config`
    -   [ ] Set `PermitRootLogin: no`
    -   [ ] restart: `sudo service sshd restart`
        -   ssh works too

## get a domain name

-   [ ] buy a domain name from some place
-   [ ] for the domain, create 2 "A" records
    -   [ ] "@" point to new server's IP
    -   [ ] "www" point to new server's IP
-   [ ]

## set up the web server

-   [ ] install nginx
-   [ ] install nodejs and npm
-   [ ] symlink node -> nodejs

## setting up the application

-   [ ] clone the app
-   [ ] cd into the app dir
-   [ ] `npm install`
-   [ ] `node app.js`
-   [ ] `nohup node app.js &` to make it run forever in the background

## build and deploy an app

-   using Gulp
