# Jekyll plus Twitter Bootstrap plus FontAwesome == FUN

This is a template I extracted from my current [blog] to be useful in
setting up new jekyll sites.

The twitter bootstrap and fontawesome files are included in this template, and
are compiled by jekyll during the build step.

## Demo

The repo is it's own demo! View on github pages as
<http://blog.tamouse.org/jekyll-twitter-bootstrap-template/>.

## Customization

If you want to customize bootstrap, modify the
`source/_sass/bootstrap/_variables.scss` file.

You can also add your own styles after bootstrap in imported, or
modify existing bootstrap styles, etc., by modifying
`source/css/styles.scss`.

## Deployment

You may first want to change the `_config.yml` file -- especially the
`baseurl` value since it points to *this* repo's *gh-pages*.

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
