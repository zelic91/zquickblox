require "bundler/gem_tasks"
require "rake/testtask"

Rake::TestTask.new do |t|
  t.libs       << "lib/zquickblox"
  t.test_files = FileList['test/lib/zquickblox/**']
  t.verbose    = true
end
task :default => :test
