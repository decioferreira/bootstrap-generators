# Bootstrap Generators

Bootstrap-generators provides Twitter Bootstrap generators for Rails 3.1. Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites. Checkout http://twitter.github.com/bootstrap.

## Installing Gem

In your Gemfile, add this line:

    gem 'bootstrap-generators', '2.0.0.dev'

Or you can install from latest build:

    gem 'bootstrap-generators', :git => 'git://github.com/decioferreira/bootstrap-generators.git'

By default Bootstrap Generators requires SimpleForm. Add the dependency on your Gemfile:

    gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

If you don't want to use SimpleForm, and instead use the default Rails form builder, just call the install generator with `--form_builder=form_builder`.

Run bundle install:

    bundle install

## Generators

Get started:

    rails generate bootstrap:install

To print the options and usage:

    rails generate bootstrap:install --help

Once you've done that, any time you generate a controller or scaffold, you'll get [Bootstrap](http://twitter.github.com/bootstrap/) templates.

Give it a try:

    rails g scaffold post title:string body:text published:boolean

## Form builders

### Default Rails form builder

    rails generate bootstrap:install --form_builder=form_builder

### SimpleForm

    rails generate bootstrap:install --form_builder=simple_form

## Layouts

There are three layouts available, based on the quick-start examples:

* Basic marketing site (default; based on [this template](http://twitter.github.com/bootstrap/examples/hero.html))
* Fluid layout (based on [this template](http://twitter.github.com/bootstrap/examples/fluid.html))
* Starter template (based on [this template](http://twitter.github.com/bootstrap/examples/starter-template.html))

To select one of these layouts just pass the option `--layout=LAYOUT` to the install generator.
