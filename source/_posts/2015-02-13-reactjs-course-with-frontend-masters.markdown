---
layout: post
title: "ReactJS course with Frontend Masters"
date: 2015-02-13 22:56
categories: [javascript]
tags: [reactjs, js-frameworks, frontend-masters]
---
I attended a course today on [ReactJS](http://reactjs.com) given by
[Ryan Florence](http://twitter.com/ryanflorence) and put on by
[Frontend Masters](http://frontendmasters.com). I loved the course,
which was a pretty high-level look at various aspects of ReactJS.

I live-tweeted during the class and took some [notes](#notes).

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> ES6 lends concise syntax</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566256102975623168">February 13, 2015</a></blockquote>
<script async src="//platform.twitter.com/widgets.js" charset="utf-8"></script>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> components are just functions</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566270909883744257">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> properties -&gt; static typing? Sort of...</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566279816869969920">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> only have to worry about the state of the DOM Right Now, not over time</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566288662590001152">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> WOOT! got an exercise to work within the time allotted!</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566295359110905857">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> consider: ReactJS is a *functional* programming paradigm (though it&#39;s using objects)</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566321394015670272">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> a huge benefit of flux is code organization and downstream understandability.</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566329610724319233">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> flux... needs a *lot* of study.</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566337920580087808">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> okay, flux is really an acquired taste.</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566338102164066304">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> <a href="https://t.co/qbbxdCfUmr">https://t.co/qbbxdCfUmr</a> -- because <a href="https://twitter.com/ryanflorence">@ryanflorence</a> missed the ember router</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566350023751774208">February 13, 2015</a></blockquote>

<blockquote class="twitter-tweet" lang="en"><p><a href="https://twitter.com/hashtag/ReactJS?src=hash">#ReactJS</a> <a href="https://twitter.com/FrontendMasters">@FrontendMasters</a> flux is a pattern, not a framework.</p>&mdash; Tamara Temple (@tamouse) <a href="https://twitter.com/tamouse/status/566366502413422592">February 13, 2015</a></blockquote>


<a name="notes"></a>

## Notes

This is just a raw paste of the notes.org file. Rough stuff, might not
make any sense.

    * build an app

    ** loaded: true

       flag to determine if the data is loaded, or if your app needs to
       think about things for a while, it doesn't look like your app is
       hung up. (Could show a spinner, etc.)

    ** React.DOM

       React creates raw DOM, which you can call directly.
       [[https://www.dropbox.com/s/dwj1z1qoevyru3h/Screen%2520Shot%25202015-02-13%2520at%25209.30.14%2520AM.png?dl%3D0][https://www.dropbox.com/s/dwj1z1qoevyru3h/Screen%20Shot%202015-02-13%20at%209.30.14%20AM.png?dl=0]]

       These are equivalent:
       https://www.dropbox.com/s/dwj1z1qoevyru3h/Screen%20Shot%202015-02-13%20at%209.30.14%20AM.png?dl=0

       Most people who think of ReactJS as a platform are using the DOM
       functions. Otherwise, and probably easier, is to use JSX
       transpiler.


    ** JSX

    ** Calling a React App
       https://www.dropbox.com/s/pw3hnirak5jorfq/Screen%20Shot%202015-02-13%20at%209.34.56%20AM.png?dl=0


    * props

      `getDefaultProps` is only called *once* -- can't do
      calculations. They are default properties for *every* instance.

    * events and state

    ** events

      There are events in ReactJS

      https://www.dropbox.com/s/3hyx5gclcrlz54i/Screen%20Shot%202015-02-13%20at%2011.16.01%20AM.png?dl=0

      #+begin_src html
        <button onClick={alertStuff.bind(this,'hi')}>hi</button>
      #+end_src

      In a React app, you have access to the normal set of javascript DOM
      events, simply by writing them as you would in HTML (camelCase).

      #+begin_src javascript
        var App = React.createClass({
          render () {
            return (
                <div><button onClick={someThing.bind(this.'hi')}>hi</button></div>
            )
          }
        })
      #+end_src

    *** BUT...

        You have to use DOM properties, not html attributes

        #+begin_src javascript
          return (
              <div className="content">
              blah blah
              </div>
          );
        #+end_src

    ** State

       Only have to think about state RIGHT NOW. Don't have worry about it
       over time. 

       Some interesting toggle thing.

       #+begin_src javascript
         var ContentToggle = React.createClass({

           // built-in - called at the beginning of instance.
           getInitialState: function() {
             return {
               showDetails: false
             };
           },

           // toggles the state of showing the details
           toggle: function() {
             this.setState({
               showDetails: !this.state.showDetails
             }, this.maybeFocus);
           },

           // ...

           // this uses the toggle
           handleKeyboard: function(event) {
             if (event.key === 'Enter' || event.key === ' ')
               this.toggle();
           },

         })  
       #+end_src


       Centralizes state. 

       something about performant rendering -- i didn't get
       this... [2015-02-13 Fri 11:35]

    * props vs. state

    ** idiom: state moves up

       Some apps / frameworks move it all the way to the top, so all state
       is held at the very highest level.

       see http://circleci.com - using Om, a clojurescript framework that
       also includes reactjs.


    ** CONSIDER: ReactJS is a *functional* programming paradigm.
       It uses objects/prototypes, etc. But program design and
       construction follows much more of a functional paradigm.

    * flux

      http://facebook.github.io/flux/docs/overview.html

      Not necessarily so great for the initial dev, but great for devs a
      month in looking at it. So: it's organizational.

      Flux is a pattern, not a framework.

    * relay - FB's new store solution

    * react-router

      not part of react itself, built by @rpflorence.

      https://github.com/rackt/react-router

      The cool thing here is the nested routing in RouteHandler.

    * converting an existing app

      Can be done piece-meal, don't have to go all in.

      Two-way data binding you have to really think about to change, but
      once you're there, it's nice.

      Start from the bottom, and climb up.
      - do all the leaves.
      - go up a level. do all the sibs.

    ** jQuery

       A bit of weirdness with jQ: it removes the element from the DOM.

       With ReactJS, you have to do funky things.

       see
       https://github.com/ryanflorence/react-training/blob/gh-pages/code/Dialog/app.js


    * what's next

    ** new JS class syntax.

      Old syntax:

      #+begin_src javascript
        var React = require('react');

        var App = React.createClass({
          render () {
            return (
                <div>
                <h1>Hello, world</h1>
              </div>
            );
          }
        });

        React.render(<App/>, document-body, () => {});

      #+end_src

      Class syntax:

      #+begin_src javascript
        var React = require('react');

        class App extends React.createComponent {
          render () {
            return (
                <div>
                <h1>Hello, world</h1>
              </div>
            );
          }
        };

        React.render(<App/>, document-body, () => {});

      #+end_src


    ** react native - mobile development

       renders to native UI on the phone instead of to DOM


    * server-side rendering

      github: rackt/react-router-mega-demo

    * hints

    ** making a space

       Normally, jsx eliminates spaces between tags, unlike standard
       html. If you *want* a space, using something like `{' '}`:

       #+begin_src javascript
           <a href="#foo">Foo</a> {' '}
           <a href="#bar">Bar</a>
       #+end_src


