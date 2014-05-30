require 'test_helper'
require 'generators/bootstrap/install/install_generator'

class InstallGeneratorTest < Rails::Generators::TestCase
  tests Bootstrap::Generators::InstallGenerator
  destination File.expand_path('../../../../tmp', __FILE__)
  arguments %w(-f)

  setup do
    prepare_destination
    prepare_dummy_app
  end

  test 'precompile assets' do
    generator.application 'config.assets.initialize_on_precompile = false'
    run_generator %W(-f --stylesheet-engine scss)
    # quietly { generator.rake 'assets:precompile' }
    generator.rake 'assets:precompile' # temporarily display errors
    assert_equal 0, $?.exitstatus
  end

  templating_systems = %w{erb haml slim}
  templating_systems.each do |templating_system|
    test "should copy controller #{templating_system} templates" do
      run_generator %W(-f --template-engine #{templating_system})

      assert_file "lib/templates/#{templating_system}/controller/view.html.#{templating_system}"
      (templating_systems - [templating_system]).each do |other_templating_system|
        assert_no_file "lib/templates/#{other_templating_system}/controller/view.html.#{other_templating_system}"
      end
    end

    test "should copy scaffold #{templating_system} templates" do
      run_generator %W(-f --template-engine #{templating_system})

      %w(index edit new show _form).each do |view|
        assert_file "lib/templates/#{templating_system}/scaffold/#{view}.html.#{templating_system}"
        (templating_systems - [templating_system]).each do |other_templating_system|
          assert_no_file "lib/templates/#{other_templating_system}/scaffold/#{view}.html.#{other_templating_system}"
        end
      end
    end

    test "should create #{templating_system} layout" do
      run_generator %W(-f --template-engine #{templating_system})

      assert_file "app/views/layouts/application.html.#{templating_system}"
    end

    test "should not skip turbolinks by default (#{templating_system} layout)" do
      run_generator %W(-f --template-engine #{templating_system})

      assert_file "app/views/layouts/application.html.#{templating_system}" do |contents|
        assert_match(/stylesheet_link_tag\s+'application', media: 'all', 'data-turbolinks-track' => true/, contents)
        assert_match(/javascript_include_tag\s+'application', 'data-turbolinks-track' => true/, contents)
      end
    end

    test "should skip turbolinks (#{templating_system} layout)" do
      run_generator %W(-f --template-engine #{templating_system} --skip-turbolinks)

      assert_file "app/views/layouts/application.html.#{templating_system}" do |contents|
        assert_no_match(/stylesheet_link_tag\s+'application', media: 'all', 'data-turbolinks-track' => true/, contents)
        assert_no_match(/javascript_include_tag\s+'application', 'data-turbolinks-track' => true/, contents)
      end
    end
  end

  test 'should copy css files' do
    run_generator %w(-f --stylesheet-engine css)

    assert_file 'app/assets/stylesheets/bootstrap-generators.css'
  end

  css_preprocessors = %w{scss less}
  css_preprocessors.each do |css_preprocessor|
    test "should copy #{css_preprocessor} files" do
      run_generator %W(-f --stylesheet-engine #{css_preprocessor})

      assert_file "app/assets/stylesheets/bootstrap-generators.#{css_preprocessor}"
      assert_file "app/assets/stylesheets/bootstrap-variables.#{css_preprocessor}"
    end
  end

  test 'should require javascript bootstrap file' do
    run_generator

    assert_file 'app/assets/javascripts/application.js', /require bootstrap/
  end

  test 'should work when there is no application.js file' do
    File.delete(File.join(destination_root, 'app/assets/javascripts/application.js'))

    assert_nothing_raised Errno::ENOENT do
      run_generator
    end
  end

  private

  def prepare_dummy_app
    FileUtils.cp_r('test/dummy/.', destination_root)
  end
end
