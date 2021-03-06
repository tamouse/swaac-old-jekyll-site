---
layout: post
title: "GraphQL: Mutating an Object's State"
date: 2017-08-20 11:08
categories: ["webdev"]
tags: ["graphql", "ruby", "rails"]
---

In our project, we have a class, Job, that includes a state machine to
handle the different states the job can be in, such as `:unscheduled`,
`:scheduled`, `:in_progress`, `:completed` , etc.

The various state transitions can include some extra logic, such as
setting or clearing dates, recording the transition step, and a few
other things. This means I can't really use a typical mutation of just
sending up attributes that change.

In addition, using the `graphql-ruby` gem with a root mutation that
breaks out into other mutations via the fields, I didn't want to
populate that root mutation with a slew of entries.

My approach was to create a `transitionJob` field in the root
mutation:


```ruby
RootMutation = GraphQL::ObjectType.define do
  name "RootMutation"
  description "Root Mutation for Kickserv Application"

  field :transitionJob, JobGraphType, "Mutation that transitions a Job to a new state" do
    argument :id, !types.Int, "Job ID (not the job_number)"
    argument :action, !types.String, "Action to perform on Job: (start|stop|restart|cancel|hold|unhold)"
    resolve JobTransitionMutation.new
  end

  # other mutations...
end
```


I created the PORO `JobTransitionMutation` to handle the actions
getting passed up to the graphql controller. This was also an
opportunity to refactor the actual transitions into and event PORO as
the same code occurred in two standard Rails controllers as well.


```ruby
class JobTransitionMutation
  def call(object, args, context)
    job = Job.find(args[:id])
    action = args[:action].to_sym
    JobStateMachineEventCrank.new(job, context).public_send(action)
    job.reload
  end
end
```


Down in the React client, the query to match that mutation looks like:

```javascript
const jobTransitionMutation = gql`
mutation JobTransitionMutation($id: Int!, $action: String!) {
  transitionJob(id: $id, action: $action) {
    id status completed_on
  }
}
`
```

A few React components create buttons that the user can press to
change the various job states that are wrapped with the query above.

-----

This took me a while to figure out, bouncing back and forth between
the ruby side and the javascript side, and digging through a lot of
documentation. I want to give a shoutout to the great folks
at [Apollo Data](https://www.apollodata.com/) for their excellent
documentation and to [Robert Mosolgo](https://github.com/rmosolgo) and
the GitHub team for
the [graphql-ruby](https://github.com/rmosolgo/graphql-ruby) gem.

-----

Future plans include converting the action into an Enum type.

I'm not quite sure what to do about the number of mutations we're
going to need. Nearly everything in the client hangs off the root node
of the account, which includes job, estimates, invoices, customers,
employees, and a whole raft of other things. The root mutation seems
like it's going to end up as large as the Rails `routes.rb` file if
I'm not careful.
