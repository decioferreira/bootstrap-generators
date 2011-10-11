require 'test_helper'

class Bootstrap::Generators::InstallGeneratorTest < ::Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Bootstrap::Generators::InstallGenerator

  setup :prepare_destination
  setup :copy_routes

  test "should copy scaffold templates" do
    run_generator

    %w(index edit new show _form).each { |view| assert_file "lib/templates/erb/scaffold/#{view}.html.erb" }
  end
end
