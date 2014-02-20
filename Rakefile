require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task :default => :test

namespace :bootstrap do
  desc "Update to a new version of Twitter Bootstrap"
  task :update do
    bootstrap_version = "3.1.1"
    striped_bootstrap_generators_version = "3.1.1"

    twitter_latest_dist_zip_url = "https://github.com/twbs/bootstrap/archive/v#{bootstrap_version}.zip"
    twitter_sass_lastest_dist_zip_url = "https://github.com/twbs/bootstrap-sass/archive/v#{bootstrap_version}.zip"
    twitter_bootstrap_dir = "tmp/bootstrap-#{bootstrap_version}"
    twitter_sass_bootstrap_dir = "tmp/bootstrap-sass-#{bootstrap_version}"

    # Make sure tmp/ dir exists
    Dir.mkdir('tmp') unless File.exists?('tmp')

    if File.exists?(twitter_bootstrap_dir)
      puts "Twitter Bootstrap already downloaded."
    else
      # Download the latest version of Twitter Bootstrap
      `wget -O tmp/bootstrap.zip #{twitter_latest_dist_zip_url}`

      # Extract Twitter Bootstrap
      `unzip -d tmp tmp/bootstrap.zip`
    end

    if File.exists?(twitter_sass_bootstrap_dir)
      puts "Twitter Bootstrap Sass already downloaded."
    else
      # Download the latest version of Twitter Bootstrap Sass
      `wget -O tmp/sass-bootstrap.zip #{twitter_sass_lastest_dist_zip_url}`

      # Extract Twitter Bootstrap
      `unzip -d tmp tmp/sass-bootstrap.zip`
    end

    # Reset Twitter Bootstrap JS files
    bootstrap_javascript_dir = 'vendor/assets/javascripts/bootstrap'
    bootstrap_main_javascript = 'vendor/assets/javascripts/bootstrap.js'

    FileUtils.rm Dir.glob("#{bootstrap_javascript_dir}/*.js")
    FileUtils.cp Dir.glob("#{twitter_bootstrap_dir}/js/*.js"), bootstrap_javascript_dir

    # Rewrite base bootstrap.js
    require_files = []
    Dir.glob("#{bootstrap_javascript_dir}/*.js") do |js_file|
      require_files << File.basename(js_file, '.*')
    end

    # Make sure that tooltip.js is before popover.js (Popover requires tooltip.js)
    tooltip_position = require_files.index('tooltip')
    popover_position = require_files.index('popover')
    require_files.insert(tooltip_position, require_files.delete_at(popover_position)) if tooltip_position > popover_position

    File.open(bootstrap_main_javascript, 'w') do |file|
      require_files.each do |require_file|
        file.write("//= require bootstrap/#{require_file}\n")
      end
    end

    # Reset Twitter Bootstrap Fonts
    bootstrap_fonts_dir = 'vendor/assets/fonts/bootstrap'

    FileUtils.rm Dir.glob("#{bootstrap_fonts_dir}/*")
    FileUtils.cp Dir.glob("#{twitter_bootstrap_dir}/fonts/*"), bootstrap_fonts_dir

    # Reset Twitter Bootstrap CSS file
    FileUtils.cp "#{twitter_bootstrap_dir}/dist/css/bootstrap.css", "vendor/assets/stylesheets/bootstrap.css"

    # Reset Twitter Bootstrap LESS files
    bootstrap_less_dir = 'vendor/twitter/bootstrap/less'

    FileUtils.rm Dir.glob("#{bootstrap_less_dir}/*.less")
    FileUtils.cp Dir.glob("#{twitter_bootstrap_dir}/less/*.less"), bootstrap_less_dir

    # Reset Twitter Bootstrap SASS files
    bootstrap_sass_dir = 'vendor/twitter/bootstrap/sass'

    FileUtils.rm Dir.glob("#{bootstrap_sass_dir}/*.scss")
    FileUtils.cp Dir.glob("#{twitter_sass_bootstrap_dir}/vendor/assets/stylesheets/bootstrap/*.scss"), bootstrap_sass_dir

    # Copy bootstrap variables
    FileUtils.cp "#{bootstrap_less_dir}/variables.less", "lib/generators/bootstrap/install/templates/assets/stylesheets/bootstrap-variables.less"
    FileUtils.cp "#{bootstrap_sass_dir}/_variables.scss", "lib/generators/bootstrap/install/templates/assets/stylesheets/bootstrap-variables.scss"

    # Change icon-font-path
    ["vendor/assets/stylesheets/bootstrap.css", "lib/generators/bootstrap/install/templates/assets/stylesheets/bootstrap-variables.less", "lib/generators/bootstrap/install/templates/assets/stylesheets/bootstrap-variables.scss"].each do |filepath|
      file_content = File.read(filepath).gsub("../fonts/", "/assets/")
      File.open(filepath, 'w') { |file| file.puts file_content }
    end

    # Generate README.md
    require 'erb'

    javascript_bootstrap_content_code = ""
    File.open(bootstrap_main_javascript, 'r').each_line do |line|
      javascript_bootstrap_content_code += "    #{line}"
    end

    template = ERB.new File.read("readme-template.md.erb")

    File.open('README.md', 'w') do |file|
      file.write(template.result(binding))
    end
  end
end
