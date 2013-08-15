require 'rspec/core/rake_task'
require 'foodcritic'

RSpec::Core::RakeTask.new :spec

FoodCritic::Rake::LintTask.new do |task|
  task.options = { fail_tags: [ 'any' ] }
end

task default: [ :foodcritic, :spec ]
