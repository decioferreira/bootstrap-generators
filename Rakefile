require 'bundler/gem_tasks'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
  t.verbose = true
end

task :default => :test

desc "Converts LESS stylesheets to SCSS"
task :less_to_scss do
  Dir.glob('vendor/assets/stylesheets/less/*.less') do |less_file|
    tree = []; level = 0
    input_file = File.new(less_file, "r")

    scss_file = File.basename(less_file, ".less")
    output_file = File.new("vendor/assets/stylesheets/scss/#{scss_file}.scss", "w")

    while(line = input_file.gets)
      # IDs
      if line.match(/^\s*#(\w+) {/)
        tree.push(line.match(/^\s*#(\w+) {/)[1])
      end

      # Less extensions
      line.gsub!(/\.less/, '')

      # Level
      if line.match(/{/)
        level += 1
      end

      if line.match(/}/)
        level -= 1
        tree = tree.first(level)
      end

      # Variables
      line.gsub!(/@(\w+)/) do |s|
        ['@media', '@import'].include?(s) ? s : s.gsub(/@(\w+)/, '$\1')
      end

      # Includes
      line.gsub!(/(#(\w+) > )*\.(\S+\(.*\)\s*;)/) do |s|
        s.gsub(/ > (#|\.)/, '-').gsub(/(#|\.)(.*;)/, '@include \2')
      end

      line.gsub!(/(#(\w+) > )+\.(\S+(\(.*\))?\s*;)/) do |s|
        s.gsub(/ > (#|\.)/, '-').gsub(/(#|\.)(.*;)/, '@include \2')
      end

      # Mixins
      line.gsub!(/\s*\.(\S+\(.*\)\s*{)/) do |s|
        "@mixin #{[tree, s.match(/\.(\S+\(.*\)\s*{)/)[1]].flatten.join('-')}"
      end

      # Functions
      line.gsub!(/spin\(/, 'adjust-hue(') # spin to adjust-hue
      line.gsub!(/[:\( ]e\(([^\)]*)\)/, ' #{\1}')

      output_file.puts line
    end

    input_file.close
    output_file.close
  end
end
