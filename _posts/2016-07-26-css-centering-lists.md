---
layout: page
title: "CSS Centering a List Horizontally and Vertically"
categories: [css]
tags: [css, centering, problems]

---

A common issue folks encounter in CSS land is the vertical and horizontal centering of something that the exact height and width cannot be predetermined.

Over on [css-tricks](https://css-tricks.com/), there's a general set of guidelines to do this. I prefer [this solution](https://css-tricks.com/centering-css-complete-guide/#both-unknown) over the others mentioned.

Sometimes it's a bit unclear still what to do when you have a list of items to center as a unit such as social icons or images.

Here's an example of doing that:


## Codepen Snippet

<p data-height="449" data-theme-id="light" data-slug-hash="YWvpOo" data-default-tab="result" data-user="tamouse" data-embed-version="2" class="codepen">See the Pen <a href="http://codepen.io/tamouse/pen/YWvpOo/">CSS Centering Lists Hrz & Vrt</a> by Tamara Temple (<a href="http://codepen.io/tamouse">@tamouse</a>) on <a href="http://codepen.io">CodePen</a>.</p>
<script async src="//assets.codepen.io/assets/embed/ei.js"></script>

## A double wrapper

In the example, there's a section on the page that's being used to show "cases" for something (for example, use cases for a tool, portfolio example boxes, site features, etc). Inside are the actual cases. To make the cases stay together while centering the set of them in the section, I've placed a wrapper div around the set of cases (and their header).

{% highlight html linenos %}
<section class="cases">
  <div class="case-wrapper">
    <heading>
      <h2>Use Cases</h2>
    </heading>
    <div class="case">
      <img src="http://placekitten.com/50"><br> You love it!
    </div>
    <div class="case">
      <img src="http://placekitten.com/50"><br> You love it!
    </div>
    <div class="case">
      <img src="http://placekitten.com/50"><br> You love it!
    </div>
  </div>
</section>
{% endhighlight %}

## CSS magic isn't

The CSS uses the relative parent and absolute child, making the `cases` section the parent and `cases-wrapper` the child.


{% highlight css linenos %}
// reset should be done first
.cases {
  postiion: relative;
}
.case-wrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  background-color: #ddffdd;
  padding: 10px;
}
.case {
  display: inline-block;
  padding: 10px;
  margin: 0;
  text-align: center;
  font-weight: bold;
  background-color: #eee;
}
{% endhighlight %}
