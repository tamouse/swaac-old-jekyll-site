---
layout: post
title: "My Way of Implementing Service Objects in Rails"
date: 2016-09-17 16:46
categories: ["rails"]
tags: ["service-objects", "poros", "plain old ruby objects"]
draft: true

---

*Update:* I decided the way I had shown was not really a very useful
way of showing how to do Rails service objects. The original verison
written back in February 2016 has been updated considerably.

Also, this isn't so much a tutorial as me thinking out loud about how
I've come to do this. It's certainly not the be-all and-all of writing
service objects in Rails. I look forward to other's thoughts.

Over the years, I've come at the idea of using POROs (Plain Old Ruby
Objects) in different ways in Rails.  In a recent work project, we are
using the concept of a "service object" to implement procedures as
POROs. I've come to like the way we are putting them together, using
things we've learned along the way, with input from other folks
advancing these ideas, including Sandi Metz and Avdi Grim, and
borrowing from @apotonick's Trailblaizer concepts.

This means of organizing code removes methods, callbacks, and lines of
code from Controllers and Models, putting them in a place it is much
simpler to write and express what is happening, and subsequently much
easier to test, maintain, and extend.

Note: The methods employed here work well with Ruby 2.3.0 and Rails
4.2.5 which I'm currently using. If you're using earlier (or even
later) versions, you may need to adjust things accordingly.

Like controllers, I also like to keep similar acting things really
paired down, including mailers and background jobs, moving all the
logic and motive peices into these service objects.

There are many ways to do this sort of thing, of course. The primary
reasons I do these is to keep testing straight-forward, and to keep
the work encapsulated and decoupled from other parts of the
application. This sort of formulation also enables composition as a
means of constructing objects, and allows for the postponement of the
implementation of the component parts.

I am also using a lot of the ActiveModel features since we are writing
these in Rails. In particular, I like the concepts of attributes,
validations, and errors that come along with ActiveRecord::Model.

One of the possibly difficult things to decide is where to put these
service object class definitions. One common practice is to add a
`services/` directory to the Rails `app/` directory. This is pretty
good for dealing with separate service objects, and if you have a set
of service objects that work together as a whole concept, you can
easily namespace them.

I've also taken the "concepts" approach from of Trailblaizer as a way to
organize the objects, and put all the various pieces in a namespace
under `app/concepts/` in the Rails application. Your choice on that,
to really be determined by your reviewers. This includes the
persistence model(s), service objects, presenters, mailers, background
jobs, and so on. I like this more as it keeps the different parts
physically close in the same directory.

## Why Service Objects at All?

Using POROs for service objects makes testing the logic of the
operation in isolation much easier than if the logic was embedded in a
Controller or Model within the application. It's easier to isolate
other functions, modules, and framework elements from the code under
test.

In general using POROs this way removes complexity from Controllers
and Models (especially ActiveRecord Models) where there would
otherwise be a growing pile of model class and instance methods,
callbacks, validations, and so on.

This way of creating service objects provides a standard way of
implementation, sure, but why not just a direct class method, or a
module with module methods?

When I first began looking at service objects, it seemed the standard
form was to create a module using nothing but module methods. Later
refinements I found led to using the module's singleton class, but I'm
afraid I don't quite get what all that means.

The primary advantage I can see for instantiating the object is that
it stays within the usual notion of a Ruby object (an instance of a
Class). This also allows other notions such as composition to
construct the object, thus allowing run time injection.

For example, suppose I needed to gather information from a few
different places and the assembly required additional components and
operations.

In her famous talk,
["Nothing is Something"](https://youtu.be/OMPfEXIlTVE), Sandi Metz
runs through a great example of using injection to organize code. Her
example also uses POROs, and I think it is a great study in organizing
code.

Using this inside Rails service objects extends the elegance of this
approach quite a lot, I think.

## Naming

One of the mistakes I've made in the past is to call my service
objects verbs, such as "BuildNewProduct", instead of naming it with a
noun: "NewProductBuilder". The former can be confusing, since it's
giving an object a verb instead of a true name, i.e., a noun. The
service object implements an (or a set of) action(s), but is not
itself the action.

Okay, let's get down to some examples.

## Premise: Builidng a Producxt Listing is a Multi-step Action

If we could rely on all the particular data attributes in a product
being available all at once, we probabaly wouldn't need a service
object for this, we'd just feed it all into the persistence object in
one go.

In our case, however, we will need to perform several operations to
gather the information necessary to create *or* update a product
listing coming from different sources:

* a slow, legacy database that is not directly open to access by Rails
* a web service that provides information about product specifications,
photographs, and such
* an inventory tracking system, to show product availability
* special options and overrides that may be set for the product

There will be two primary persistence models here, `Catalog`, which
has many `Product` objects. We'll stay with Rails' convention and put
those under `app/models/catalog.rb` and
`app/models/product.rb`. Following convention leaves those models in
the usual place for use by the rest of the application.

In the real case, we'd probably have models for manufacturers,
vendors, and other things like that.

For the non-persistance models, I am going with the `app/concepts/`
approach and create our service objects under the concept
`CatalogBuilder`, the concept being I am building a catalog which is
a collection of products.



## Using options to inject components

In some of our project's ETL (Extract, Transform, Load) Runners, we go
off to the network and fetch some data. While there are things like
VCR and WebMock available for testing, I wanted to have something that
would allow in-situ substitution should it prove necessary. In some
cases, for example, I wanted to be able to execute the runner to
gather the pristine responses for other uses, including load testing
and building a working development database for other aspects of
development.

Here is a somewhat redacted skeleton of one of the runners that
fetches product specification information from a third party.

``` ruby
class Etl::Runner::ProductSpecificationFetch < Etl::Runner::Base
  DEFAULT_APP_ID = Rails.application.secrets.etl_default_app_id

  attr_accessor :datafilename, :mfr_datafilename, :product_spec_client, :app_id

  def initialize(*args)
    options = args.extract_options!
    super(*args)
    self.datafilename = options.fetch(:products_filename, default_products_filename)
    self.mfr_datafilename = options.fetch(:manufacturers_filename, default_manufacturers_filename)
    self.app_id = options.fetch(:app_id, DEFAULT_APP_ID)
    self.product_spec_client = options.fetch(:product_spec_client, default_product_spec_client)
  end

  def run
    # ... lots of other code ...
  end

  def default_product_spec_client
    ProductSpecificationClient.new(app_id: app_id)
  end

  def default_products_filename
    File.join(data_dir, Etl::Runner::DATA_FILES[:product_specifications])
  end

  def default_manufacturers_filename
    File.join(data_dir, Etl::Runner::DATA_FILES[:manufacturers])
  end
end
```


In this example, I can provide an alternate service object to
implement the client that talks to third party, and different means of
obtaining the two output files for this service object. This is one I
used that saved the responses from the service into a file.

``` ruby
require "product_specification_client"
class SavingProductSpecificationClient < ProductSpecificationClient

  attr_accessor :save_dir

  def initialize(app_id: "", save_dir: ".")
    super(app_id: app_id)
    self.save_dir = save_dir
    FileUtils.mkdir_p(self.save_dir)
  end

  protected

  def get(method, parameters={})
    super(method, parameters).tap do |response|
      File.write(File.join(@save_dir, "#{method}.#{slugify(parameters)}.xml"), response)
    end
  end

  def slugify(parameters={})
    # some code that converts a hash into a slug for a file name fragment
  end

end
```

By using this alternate version, I could build a rake task to call the
runner shown above, injecting the above client, and save all the raw
XML responses.

In this particular case, I chose to inherit from the client because of
the way the client handles the actual method calls using
`missing_method`, requiring less code here.

Admittedly there is a lot more to this application that the snippet of
code above, but it should serve as an example of the sort of thing one
can do to create and use a service object.
