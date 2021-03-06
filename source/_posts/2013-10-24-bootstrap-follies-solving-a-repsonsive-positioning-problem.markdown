---
layout: post
title: "Bootstrap Follies: Solving a repsonsive positioning problem"
date: 2013-10-24 09:23
categories: [technology]
tags: [twitter-bootstrap]
---
From a [recent post](https://plus.google.com/106228045683754487176/posts/iJXoDjPHKbn)
on the Twitter Bootstrap google plus community, the correspondent
wanted to know how to make a sidebar move under a navigation bar in a
layout, like so:

![](/images/layout-saine-jeune.jpg ) 

The following [jsfiddle](http://jsfiddle.net/Eqcjg/2/)
explains how pretty well:

*(Note that there's no Javascript in the fiddle, click on the HTML,
CSS, and result.)*

<iframe width="100%" height="300"
src="http://jsfiddle.net/Eqcjg/2/embedded/"
allowfullscreen="allowfullscreen" frameborder="0"></iframe>


{% highlight html linenos %}
<div class="container">
  <div class="row">
    <div class="col-xs-12 col-md-8">
      <div class="well one">1</div>
    </div>
    <div class="col-xs-12 col-md-4">
      <div class="well two">2</div>
    </div>
    <div class="col-xs-12 col-md-8">
      <div class="well three">3</div>
      <div class="well four">4</div>     
    </div>
  </div>
</div>
{% endhighlight %}

{% highlight css linenos %}
@import url('//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css');

/*
  this is the magic right here - the media query for screen size that
  only floats the particular divs to the right. 
*/
@media screen and (min-width: 970px) {
    .col-md-8{
        float:right 
    }
}
.one{
    min-height: 200px;
}
.two{
    min-height: 800px;
}
.three{
    min-height: 400px;
}
.four{
    min-height: 300px;
}
{% endhighlight %}

The way this works is to set up the various column options in TBS for
your divs. In the medium format, `col-md-8` gets floated to the right
side of the page. Since there are two `div`s that get set that way,
when the page is narrowed the `col-md-8` goes out of play and the
`col-xs-12` goes into play, reordering the stack.

Pretty cool solution, actually.

