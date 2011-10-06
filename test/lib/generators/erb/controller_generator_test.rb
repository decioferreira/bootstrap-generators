require 'test_helper'

class Erb::Generators::ControllerGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Rails::Generators::ControllerGenerator
  arguments %w(Account foo bar --template-engine erb)

  setup :prepare_destination
  setup :copy_routes

  test "should invoke template engine" do
    run_generator
    assert_file "app/views/account/foo.html.erb", %r(app/views/account/foo\.html\.erb)
    assert_file "app/views/account/bar.html.erb", %r(app/views/account/bar\.html\.erb)
  end
end

