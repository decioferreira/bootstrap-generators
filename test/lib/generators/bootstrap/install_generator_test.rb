require 'test_helper'

class Bootstrap::Generators::InstallGeneratorTest < ::Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Bootstrap::Generators::InstallGenerator
  arguments %w(--template-engine erb)

  setup :prepare_destination
  setup :copy_routes

  test "should copy controller erb templates" do
    run_generator

    assert_file "lib/templates/erb/controller/view.html.erb"
    assert_no_file "lib/templates/haml/controller/view.html.haml"
  end

  test "should copy controller haml templates" do
    run_generator %w(--template-engine haml)

    assert_file "lib/templates/haml/controller/view.html.haml"
    assert_no_file "lib/templates/erb/controller/view.html.erb"
  end

  test "should copy scaffold erb templates" do
    run_generator

    %w(index edit new show _form).each { |view|
      assert_file "lib/templates/erb/scaffold/#{view}.html.erb"
      assert_no_file "lib/templates/haml/scaffold/#{view}.html.haml"
    }
  end

  test "should copy scaffold haml templates" do
    run_generator %w(--template-engine haml)

    %w(index edit new show _form).each { |view|
      assert_file "lib/templates/haml/scaffold/#{view}.html.haml"
      assert_no_file "lib/templates/erb/scaffold/#{view}.html.erb"
    }
  end

  test "should copy javascript files" do
    run_generator

    assert_file "app/assets/javascripts/bootstrap-generators.js"
  end

  test "should copy css files" do
    run_generator %w(--stylesheet-engine css)

    assert_file "app/assets/stylesheets/bootstrap-generators.css"
  end

  test "should copy scss files" do
    run_generator %w(--stylesheet-engine scss)

    assert_file "app/assets/stylesheets/bootstrap-generators.css.scss"
    assert_file "app/assets/stylesheets/bootstrap-variables.css.scss"
  end

  test "should copy less files" do
    run_generator %w(--stylesheet-engine less)

    assert_file "app/assets/stylesheets/bootstrap-generators.css.less"
    assert_file "app/assets/stylesheets/bootstrap-variables.less"
  end

  test "should create erb layout" do
    run_generator

    assert_file "app/views/layouts/application.html.erb"
  end

  test "should create haml layout" do
    run_generator %w(--template-engine haml)

    assert_file "app/views/layouts/application.html.haml"
  end

  test "should create fluid erb layout" do
    run_generator %w(--layout fluid)

    assert_file "app/views/layouts/application.html.erb"
  end

  test "should create fluid haml layout" do
    run_generator %w(--template-engine haml --layout fluid)

    assert_file "app/views/layouts/application.html.haml"
  end

  test "should create erb form partial with simple_form form builder" do
    run_generator %w(--form-builder simple_form)

    assert_file "lib/templates/erb/scaffold/_form.html.erb"
  end

  test "should create haml form partial with simple_form form builder" do
    run_generator %w(--form-builder simple_form --template-engine haml)

    assert_file "lib/templates/haml/scaffold/_form.html.haml"
  end

  test "should copy config when simple_form form builder selected" do
    run_generator %w(--form-builder simple_form)

    assert_file "config/initializers/simple_form.rb"
  end
end
