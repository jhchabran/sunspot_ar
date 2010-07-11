Gem::Specification.new do |s|

  s.name = %q{sunspot_ar}
  s.version = File.open('VERSION').read
  s.homepage = "http://github.com/jhchabran/sunspot_ar"

  s.summary = %Q{ActiveRecord integration for the Sunspot Solr search library}
  s.description = %Q{Sunspot::ActiveRecord is an extension to the Sunspot library for Solr search.
  Sunspot::ActiveRecord adds integration between Sunspot and ActiveRecord, including
  defining search and indexing related methods on ActiveRecord models themselves,
  running a Sunspot-compatible Solr instance for development and test
  environment.}

  s.require_path = 'lib'
  s.files = %w(LICENSE README.rdoc Rakefile) + Dir.glob("{lib/**/*")
  s.rubyforge_project = %q{sunspot_ar}

  s.email = "jh@chabran.fr"
  s.authors = ["Mat Brown", "Peer Allan", "Michael Moen", "Benjamin Krause", "Adam Salter", "Brandon Keepers", "Paul Canavese", "JH. Chabran"]

  s.required_rubygems_version = ">= 1.3.6"
  s.date = Time.now.strftime("%Y-%m-%d")

  s.extra_rdoc_files = Dir["*.rdoc"]
  s.rdoc_options = ["--charset=UTF-8"]

  s.add_development_dependency "rspec", ">= 1.2.9"
  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "sqlite3"
  s.add_runtime_dependency "escape", ">= 0.0.4"
  s.add_runtime_dependency "sunspot", "= 1.1.0"

end