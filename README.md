# MealJam
Coursework project for COM2025 – Web Applications Development.

- **Ruby version:** 3.0.2
- **Rails version:** 6.1.4.1
- **Dependencies:**
  - **Node.js**: 16.9.1 (or LTS)
  - **Yarn**: version 1.22.x+ (the repo uses Yarn Berry/2+, but 1.22.x
  or later should use the included version in
  [`.yarn/releases`](.yarn/releases)).
  - **PostgreSQL**: latest

This project is built using Vue.js and Inertia.js for front-end
rendering, and powered by Ruby on Rails. Unlike a typical Ruby on
Rails application, most of the presentational code is not stored in
`app/views/*`, rather just the `application.html.erb` which serves
as a core layout template with basic HTML and meta tags and the CSS/JS
script includes.

Vue.js is a declarative JavaScript front-end user interface framework
which replaces legacy imperative JavaScript frameworks and libraries
for interface such as jQuery and jQuery UI. Whilst using Vue.js would
typically imply the front-end code be more or less entirely decoupled
from the Ruby code, this is not the case in this project; Inertia.js,
&ldquo;the modern monolith&rdquo;, acts as the glue between the
front-end and back-end of the project, organizing page and application
(business logic) data as it passes between the client Vue.js application
running in the user's browser and the Rails server application.

The presentational code (which is written in Vue.js) is in
[`app/javascript`](app/javascript). The pages, as defined in the
[`config/routes.rb`](config/routes.rb) file are in
[`app/javascript/Pages`](app/javascript/Pages). These may or may not
also use a Vue-based layout from
[`app/javascript/Layouts`](app/javascript/Layouts) or shared
components from
[`app/javascript/Components`](app/javascript/Components).

## Setup
1. Run `bundle install` to fetch Ruby's dependencies.
2. Run `yarn` from the package root to install the Node.js
dependencies.
3. Run `rake js:routes` to ensure the routing is up-to-date.
4. Finally, use `bin/rails server` to start the server.

## Development
- After updating the routes file, be sure to run `rake js:routes`,
this is important because the front-end (or 'client side') needs to
be made aware of what routes are available.
- Use `bin/vite dev` to start the HMR (hot module reload/replacement)
server. This will watch key files for changes and automatically reload
the webpage when they're detected.

## Configuration
At this stage, most of the configuration should work out of the box.
You will, however, need to either ensure the following environment
variables are set traditionally, for production, or using a `.env`
file in the root of the project for development and testing:
- **[DEV]**: `HEROKU_POSTGRES_ONYX_URL` (rename the environment variable
appropriately for your test database URL. This should not be needed
in the production environment.)
- **[PROD]**:`DATABASE_URL`: your production database's connection URL.

On Heroku, all these values can be obtained by going to `Settings`
&rarr; `Reveal Config Vars` and copying the two database URLs.

Additionally, ensure - if you're setting the project up on Heroku -
that you attach at least one PostgreSQL database to your project.

<!--
Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
-->