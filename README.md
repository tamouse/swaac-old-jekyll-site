# Jekyll plus Twitter Bootstrap plus FontAwesome == FUN

This is a template I extracted from my current [blog] to be useful in
setting up new jekyll sites.

The twitter bootstrap and fontawesome files are included in this template, and
are compiled by jekyll during the build step.

## Customization

If you want to customize bootstrap, modify the
`source/_sass/bootstrap/_variables.scss` file.

You can also add your own styles after bootstrap in imported, or
modify existing bootstrap styles, etc., by modifying
`source/css/styles.scss`.

## Deployment

There is a deployment script in `script/deploy.sh` that by default
assumes a `_deploy` directory in root that contains it's own `.git`
subdirectory, and that the currently checked-out branch is the
deployment branch. It's a pretty dumb shell script, modify as you
like.

## Jekyllpress

The template is already set up to use [Jekyllpress] templates. You
should feel free to modify these to your needs, as well. I wrote
[Jekyllpress] as well, and if you have ideas there, feel free to let
me know!

[Jekyllpress]: http://github.com/tamouse/jekyllpress "A nice little jekyll utility to help make blog posts and pages."
