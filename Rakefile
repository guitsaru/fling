require "bundler/gem_tasks"
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new('spec')

task :default => :spec

desc "Opens a console requiring fling"
task :console do
  `bundle exec irb -r lib/fling.rb`
end
