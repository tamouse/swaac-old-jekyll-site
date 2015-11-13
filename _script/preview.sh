#!/bin/sh
set -v

: ${PORT:=4005}

bundle exec jekyll serve -P $PORT --baseurl='' --drafts --incremental
