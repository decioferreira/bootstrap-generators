# Bootstrap Generators

Bootstrap-generators provides Twitter Bootstrap generators for Rails 3.1. Bootstrap is a toolkit from Twitter designed to kickstart development of webapps and sites. Checkout http://twitter.github.com/bootstrap.

## Installing Gem

In your Gemfile, add this line:

    gem 'bootstrap-generators', '2.0.0.dev'

Or you can install from latest build:

    gem 'bootstrap-generators', :git => 'git://github.com/decioferreira/bootstrap-generators.git'

By default Bootstrap Generators requires SimpleForm. Add the dependency on your Gemfile:

    gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

If you don't want to use SimpleForm, just pass the `--form_builder=form_builder` option:

    rails generate bootstrap:install --form_builder=form_builder

Run bundle install:

    bundle install

## Generators

Get started:

    rails generate bootstrap:install

Once you've done that, any time you generate a controller or scaffold, you'll get [Bootstrap](http://twitter.github.com/bootstrap/) templates.

### Give it a try

    rails g scaffold post title:string body:text published:boolean

## Usage

To print the options and usage run the command `rails generate bootstrap:install --help`

    rails generate bootstrap:install [options]

    Options:
          [--layout=LAYOUT]                         # Bootstrap layout templates (hero, fluid or starter-template)
                                                    # Default: hero
          [--form-builder=FORM_BUILDER]             # Select your form builder (form_builder or simple_form)
                                                    # Default: simple_form
      -e, [--template-engine=TEMPLATE_ENGINE]       # Indicates when to generate template engine
                                                    # Default: erb
      -se, [--stylesheet-engine=STYLESHEET_ENGINE]  # Indicates when to generate stylesheet engine
                                                    # Default: scss

    Runtime options:
      -f, [--force]    # Overwrite files that already exist
      -p, [--pretend]  # Run but do not make any changes
      -q, [--quiet]    # Supress status output
      -s, [--skip]     # Skip files that already exist

    Copy BootstrapGenerators default files

### Options

#### Layouts

There are the three available layouts, based on Bootstrap's quick-start examples:

* [Basic marketing site](http://twitter.github.com/bootstrap/examples/hero.html) (default)
* [Fluid layout](http://twitter.github.com/bootstrap/examples/fluid.html)
* [Starter template](http://twitter.github.com/bootstrap/examples/starter-template.html)

To select one of these layouts just pass the option `--layout=LAYOUT` to the install generator.

#### Form builders

* SimpleForm

By default Bootstrap Generators requires SimpleForm. Add the dependency on your Gemfile:

    gem 'simple_form', :git => 'git://github.com/plataformatec/simple_form.git'

And then run:

    rails generate bootstrap:install --form_builder=simple_form

* Default Rails form builder

If you don't want to use SimpleForm, just pass the `--form_builder=form_builder` option:

    rails generate bootstrap:install --form_builder=form_builder

#### Template engines

Supported template engines:

* ERB
* Haml

Add the dependency on your Gemfile:

    gem 'haml-rails'

And then run:

    rails generate bootstrap:install --template-engine=haml

#### Stylesheet engines

Supported stylesheet engines:

* CSS
* SCSS

## Assets

### Javascript

Select all jQuery plugins (`app/assets/javascripts/bootstrap.js`)

    //= require bootstrap

Or quickly add only the necessary javascript (Transitions: required for any animation; Popovers: requires Tooltips)

    //= require bootstrap-transition
    //= require bootstrap-alert
    //= require bootstrap-modal
    //= require bootstrap-dropdown
    //= require bootstrap-scrollspy
    //= require bootstrap-tab
    //= require bootstrap-tooltip
    //= require bootstrap-popover
    //= require bootstrap-button
    //= require bootstrap-collapse
    //= require bootstrap-carousel
    //= require bootstrap-typeahead
