---
layout: post
title: "ActiveRecord: Enhanced Query Objects"
date: 2013-09-20 18:09
categories: [swaac]
tags: [rails, enhanced-query-objects, scopes, activerecord, poros]
source: http://hasghari.github.io/2013/09/15/active-record-enhanced-query-objects.html?utm_source=rubyweekly&utm_medium=email
---
A repost of <{{page.source}}>.


> ActiveRecord: Enhanced Query Objects
> ------------------------------------
> 
> 15 Sep 2013
> 
> Your ActiveRecord models are usually the first place in your application
> where the unwieldy code begs for refactoring.
> 
> In an excellent post by Bryan Helmkamp on the Code Climate Blog, he
> outlined [7 Patterns to Refactor Fat ActiveRecord
> Models](http://blog.codeclimate.com/blog/2012/10/17/7-ways-to-decompose-fat-activerecord-models/).
> One of the patterns from this blog post that I want to focus on is
> **Extract Query Objects**.
> 
> We have been using this pattern for a while but I missed the convenience
> of chainable and reusable scopes. Here's an example:
> 
>      1 class Product < ActiveRecord::Base
>      2   has_many :reviews
>      3 end
>      4 
>      5 class PopularProductQuery
>      6   def initialize(relation = Product.scoped)
>      7     @relation = relation
>      8   end
>      9 
>     10   def popular(time)
>     11     @relation.joins(:reviews).where(reviews: { created_at: time..Time.now,
>     12                                                available: true })
>     13   end
>     14 
>     15   def with_recent_activity(time)
>     16     @relation.joins(:reviews).where(reviews: { created_at: time..Time.now })
>     17   end
>     18 
>     19   def with_available_reviews
>     20     @relation.joins(:reviews).where(reviews: { available: true })
>     21   end
>     22 end
> 
> The query object above defines three utility methods to return records
> of `Product` with certain properties. However, you will notice that
> `PopularProductQuery#popular` is combining the logic of
> `#with_recent_activity` and `#with_available_reviews`. The trivial
> solution to keeping this DRY is defining scopes on the `Product` model:
> 
>      1 class Product < ActiveRecord::Base
>      2   has_many :reviews
>      3 
>      4   scope :popular, ->(time) {
>      5     with_recent_activity(time).with_available_reviews
>      6   }
>      7 
>      8   scope :with_recent_activity, ->(time) {
>      9     joins(:reviews).where(reviews: { created_at: time..Time.now })
>     10   }
>     11 
>     12   scope :with_available_reviews, ->(time) {
>     13     joins(:reviews).where(reviews: { available: true })
>     14   }
>     15 end
> 
> Ideally we would like to define these scopes on our query objects to
> prevent our models from growing "fat" over time. If these scopes were so
> common that they would be used across many different contexts in our
> application, we would probably want to keep them on the model but for
> the purpose of this post, let's assume that these are very specific
> scopes that we would like to isolate to the query object.
> 
> An existing but rarely advertised feature of ActiveRecord is that you
> have the ability to extend any `ActiveRecord::Relation` object with your
> custom scopes:
> 
>      1 class PopularProductQuery
>      2   def initialize(relation = Product.scoped)
>      3     @relation = relation.extending(Scopes)
>      4   end
>      5 
>      6   def popular(time)
>      7     @relation.with_recent_activity(time).with_available_reviews
>      8   end
>      9 
>     10   module Scopes
>     11     def with_recent_activity(time)
>     12       joins(:reviews).where(reviews: { created_at: time..Time.now })
>     13     end
>     14 
>     15     def with_available_reviews
>     16       joins(:reviews).where(reviews: { available: true })
>     17     end
>     18   end
>     19 end
> 
> Here we are taking advantage of the
> `ActiveRecord::QueryMethods#extending` method to add custom scopes to
> our query object without polluting the model space. In other words,
> `Product.with_available_reviews` is **not** valid. To put it all
> together, you would use the enhanced query object like so:
> 
>     PopularProductQuery.new.popular(2.weeks.ago)
> 
> I've come to really like this pattern to adhere to the Single
> Responsibility Principle and keep my models manageable.
> 
> \
> 
> Please enable JavaScript to view the [comments powered by
> Disqus.](http://disqus.com/?ref_noscript)
> 
> [comments powered by Disqus](http://disqus.com)
> 
> Hamed Asghari\
>  Ruby, JavaScript and Go enthusiast\
>  hasghari@gmail.com
> 
> [github.com/hasghari](https://github.com/hasghari)\
>  [twitter.com/phyrengr](https://twitter.com/phyrengr)\
> 
