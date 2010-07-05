require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "sunspot_ar"
    gem.summary = %Q{ActiveRecord integration for the Sunspot Solr search library}
    gem.description = %Q{Sunspot::ActiveRecord is an extension to the Sunspot library for Solr search.
    Sunspot::ActiveRecord adds integration between Sunspot and ActiveRecord, including
    defining search and indexing related methods on ActiveRecord models themselves,
    running a Sunspot-compatible Solr instance for development and test
    environment.}
    gem.email = "jh@chabran.fr"
    gem.homepage = "http://github.com/jhchabran/sunspot_ar"
    gem.authors = ["Mat Brown", "Peer Allan", "Michael Moen", "Benjamin Krause", "Adam Salter", "Brandon Keepers", "Paul Canavese", "JH. Chabran"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_runtime_dependency "escape", ">= 0.0.4"
    gem.add_runtime_dependency "sunspot", "= 1.1.0"
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "sunspot_ar #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
