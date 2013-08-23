require 'test_helper'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Bootstrap::Generators::InstallGenerator
  destination File.join(Rails.root)
  arguments %w(--template-engine erb)

  setup :prepare_destination
  setup :copy_routes
  setup :copy_application_javascript

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

  test "should require javascript bootstrap file" do
    run_generator

    assert_file "app/assets/javascripts/application.js", /require bootstrap/
  end

  test "should work when there is no application.js file" do
    File.delete(File.join(destination_root, "app/assets/javascripts/application.js"))

    assert_nothing_raised Errno::ENOENT do
      run_generator
    end
  end

  test "should copy css files" do
    run_generator %w(--stylesheet-engine css)

    assert_file "app/assets/stylesheets/bootstrap-generators.css"
  end

  test "should copy scss files" do
    run_generator %w(--stylesheet-engine scss)

    assert_file "app/assets/stylesheets/bootstrap-generators.scss"
    assert_file "app/assets/stylesheets/bootstrap-variables.scss"
  end

  test "should copy less files" do
    run_generator %w(--stylesheet-engine less)

    assert_file "app/assets/stylesheets/bootstrap-generators.less"
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
end
