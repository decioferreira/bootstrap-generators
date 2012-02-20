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
    file = File.new(less_file, "r")
    puts less_file
    while(line = file.gets)
      puts line

      # Variables
      line.gsub!(/@(\w+)/, '$\1')
      # Includes
      line.gsub!(/\.(\S+\([^\)]*\)\s*;)/, '@include \1')
      # Mixins
      line.gsub!(/\.(\S+\([^\)]*\)\s*{)/, '@mixin \1')

      puts line
    end
    file.close
  end
end
