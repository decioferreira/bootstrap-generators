require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib'
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = false
end

task default: :test

namespace :bootstrap do
  desc "Update to a new version of Twitter Bootstrap"
  task :update do
    bootstrap_version = "3.3.4"
    striped_bootstrap_generators_version = "3.3.4"

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

    # Reset Twitter Bootstrap Fonts
    bootstrap_fonts_dir = 'vendor/assets/fonts/bootstrap'

    FileUtils.rm Dir.glob("#{bootstrap_fonts_dir}/*")
    FileUtils.cp Dir.glob("#{twitter_bootstrap_dir}/fonts/*"), bootstrap_fonts_dir

    # Reset Twitter Bootstrap CSS file
    FileUtils.cp "#{twitter_bootstrap_dir}/dist/css/bootstrap.css", "vendor/assets/stylesheets/bootstrap.css.erb"
    FileUtils.cp "#{twitter_bootstrap_dir}/dist/css/bootstrap.css.map", "vendor/assets/stylesheets/bootstrap.css.map"

    # Reset Twitter Bootstrap LESS files
    bootstrap_less_dir = 'vendor/twitter/bootstrap/less'

    FileUtils.rm Dir.glob("#{bootstrap_less_dir}/**/*.less")
    FileUtils.cp Dir.glob("#{twitter_bootstrap_dir}/less/*.less"), bootstrap_less_dir
    FileUtils.cp Dir.glob("#{twitter_bootstrap_dir}/less/mixins/*.less"), "#{bootstrap_less_dir}/mixins"

    # Reset Twitter Bootstrap SASS files
    bootstrap_sass_dir = 'vendor/twitter/bootstrap/sass'

    FileUtils.rm Dir.glob("#{bootstrap_sass_dir}/**/*.scss")
    FileUtils.cp Dir.glob("#{twitter_sass_bootstrap_dir}/assets/stylesheets/*.scss"), bootstrap_sass_dir
    FileUtils.cp Dir.glob("#{twitter_sass_bootstrap_dir}/assets/stylesheets/bootstrap/*.scss"), "#{bootstrap_sass_dir}/bootstrap"
    FileUtils.cp Dir.glob("#{twitter_sass_bootstrap_dir}/assets/stylesheets/bootstrap/mixins/*.scss"), "#{bootstrap_sass_dir}/bootstrap/mixins"

    # Copy bootstrap variables
    FileUtils.cp "#{bootstrap_less_dir}/variables.less", "lib/generators/bootstrap/install/templates/assets/stylesheets/bootstrap-variables.less"
    FileUtils.cp "#{bootstrap_sass_dir}/bootstrap/_variables.scss", "lib/generators/bootstrap/install/templates/assets/stylesheets/bootstrap-variables.scss"

    # Asset helpers
    Dir.glob('**/*.css.erb').each do |filepath|
      file_content = File.read(filepath)

      # Remove fonts path
      file_content.gsub!("../fonts/", "bootstrap/")

      # Asset helpers for fonts
      file_content.gsub!(%r{(["'][\w\-@{}$#\/]+\.(eot|woff|ttf|svg)["'])}, '\'<%= font_path(\1) %>\'')
      file_content.gsub!(%r{(["'])([\w\-@{}$#\/]+\.(eot|woff|ttf|svg))(\??#[\w\-@{}$#]+["'])}, '\'<%= font_path(\1\2\1) %>\4')

      File.open(filepath, 'w') { |file| file.puts file_content }
    end

    Dir.glob('**/*.scss').each do |filepath|
      file_content = File.read(filepath)

      # Remove fonts path
      file_content.gsub!("../fonts/", "")

      # Asset helpers for fonts
      file_content.gsub!(%r{(["'\w\-@{}$#\/]+\.(eot|woff|ttf|svg)(\??#[\w\-@{}$#]+)?["'])}, '\1')

      # Asset helpers for images
      file_content.gsub!(%r{image: url\(}, 'image: image-url(')

      File.open(filepath, 'w') { |file| file.puts file_content }
    end

    Dir.glob('**/*.less').each do |filepath|
      file_content = File.read(filepath)

      # Remove fonts path
      file_content.gsub!("../fonts/", "bootstrap/")

      # Asset helpers for fonts
      file_content.gsub!(%r{~"url\(([^)]+)\)( [^"]*)?"}, 'font-url(~"\1")\2')

      # Asset helpers for images
      file_content.gsub!(%r{image: url\(}, 'image: image-url(')

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
