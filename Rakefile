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
        s.gsub(/@(\w+)/, '$\1') unless s == '@media'
      end

      # Includes
      line.gsub!(/(#(\w+) > )*\.(\S+\(.*\)\s*;)/) do |s|
        s.gsub(/ > (#|\.)/, '-').gsub(/#(.*;)/, '@include \1')
      end

      # Mixins
      line.gsub!(/\s*\.(\S+\(.*\)\s*{)/) do |s|
        "@mixins #{[tree, s.match(/\.(\S+\(.*\)\s*{)/)[1]].flatten.join('-')}"
      end

      output_file.puts line
    end

    input_file.close
    output_file.close
  end
end
