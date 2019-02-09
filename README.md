# To-Do List

A Sinatra to-do list web application, which allows the user to add, edit, delete and filter to-do items. Utilises RESTFUL routes and query parameters.

- [To-Do List](#to-do-list)
  - [Preview](#preview)
  - [Features](#features)
  - [Install](#install)
  - [Testing](#testing)
      - [Running Tests - RSpec](#running-tests---rspec)
      - [Running Tests - Rack::Test](#running-tests---racktest)
  - [Features To Add](#features-to-add)
  - [Related Blog Posts](#related-blog-posts)

## Preview

![To Do List Preview](to-do-list-app.gif)

## Features

- The user can:

  - Add, edit and delete a list item
  - Mark a list item as complete
  - Mark a list item as incomplete
  - Filter items to see completed, incomplete or all
  - Can clear completed items

## Install

Note: if you don't have Ruby installed, you can find instructions [here](https://www.ruby-lang.org/en/documentation/installation/).

```
git clone https://github.com/itsellej/ruby-todo-list-app.git
cd ruby-to-do-list-app
rackup
```

In your browser, navigate to `http://localhost:9292/`

## Testing

All classes are tested using [RSpec](http://rspec.info/documentation/). Sinatra is tested using [Rack::Test](http://sinatrarb.com/testing.html)

#### Running Tests - RSpec

In the terminal, type: `rspec`

To run tests for individual classes: `rspec spec/[name of test file]`

#### Running Tests - Rack::Test

In the terminal, type: `ruby app_test.rb`

## Features To Add

- Store list items in a database (Postgres)
- A toggle all button, to mark all list items as complete or incomplete
- Allow the user to add a "complete by" date when an item is added and edited
- Allow the user to filter and view overdue items
- Allow the user to have multiple to-do lists
- Deploy to Heroku

## Related Blog Posts
Blog posts published to [Medium](https://medium.com/@ellehallal/) during the creation of the To Do List App:
- [To Do List web app using Sinatra](https://medium.com/@ellehallal/week-7-to-do-list-web-app-using-sinatra-ae33d342cdb6)
- [HTTP Verbs & Query Parameters — To Do List](https://medium.com/@ellehallal/week-9-%C2%BD-http-verbs-query-parameters-to-do-list-e56f469ff354)
