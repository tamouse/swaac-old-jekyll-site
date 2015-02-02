#!/bin/sh
set -v

: ${LIMIT_POSTS:=10}
: ${PORT:=4005}

jekyll serve -P $PORT --baseurl='' --limit_posts $LIMIT_POSTS --trace
