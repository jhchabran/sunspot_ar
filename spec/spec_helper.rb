if rsolr_version = ENV['RSOLR_GEM_VERSION']
  STDERR.puts("Forcing RSolr version #{rsolr_version}")
  gem "rsolr", rsolr_version
end

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'sunspot_ar'
require 'spec'
require 'spec/autorun'
require 'database_cleaner'

TEST_DATABASE_FILE = File.join(File.dirname(__FILE__), '..', 'test.sqlite3')
ActiveRecord::Base.logger = Logger.new(File.join(File.dirname(__FILE__), "activerecord.log"))

File.unlink(TEST_DATABASE_FILE) if File.exist?(TEST_DATABASE_FILE)
ActiveRecord::Base.establish_connection(
  :adapter => 'sqlite3',
  :database =>  "#{File.dirname(__FILE__)}/db/test.sqlite3"
)

ActiveSupport::Dependencies.load_paths << "#{File.dirname(__FILE__)}/models"

def load_schema
  stdout = $stdout
  $stdout = StringIO.new # suppress output while building the schema
  load(File.dirname(__FILE__) + '/schema.rb')
  
  $stdout = stdout
end

def silence_stderr(&block)
  stderr = $stderr
  $stderr = StringIO.new
  yield
  $stderr = stderr
end

Spec::Runner.configure do |config|
  load_schema
  Sunspot.remove_all!
  
  config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end

    config.before(:each) do
      DatabaseCleaner.start
    end

    config.after(:each) do
      DatabaseCleaner.clean
    end
end

module Spec
  module Mocks
    module Methods
      def should_respond_to_and_receive(*args, &block)
        respond_to?(args.first).should ==(true)
        should_receive(*args, &block)
      end
    end
  end
end


