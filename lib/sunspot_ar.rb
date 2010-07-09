require 'sunspot'
require 'sunspot_ar/configuration'
require 'sunspot_ar/adapters'
require 'sunspot_ar/searchable'

module Sunspot
  module ActiveRecord
    class <<self
      attr_writer :configuration

      def configuration
        @configuration ||= Sunspot::ActiveRecord::Configuration.new
      end

      def reset
        @configuration = nil
      end
      
      def install
        setup  

        unless configuration.disabled?
          ::Sunspot::Adapters::InstanceAdapter.register(Sunspot::ActiveRecord::Adapters::ActiveRecordInstanceAdapter, ::ActiveRecord::Base)
          ::Sunspot::Adapters::DataAccessor.register(Sunspot::ActiveRecord::Adapters::ActiveRecordDataAccessor, ::ActiveRecord::Base)
          ::ActiveRecord::Base.module_eval { include(Sunspot::ActiveRecord::Searchable) }
        else
          ::ActiveRecord::Base.module_eval { include(Sunspot::ActiveRecord::DummySearchable) }
        end
      end
      
      private
      def setup
        Sunspot.config.solr.url = URI::HTTP.build(
        :host => configuration.hostname,
        :port => configuration.port,
        :path => configuration.path
        ).to_s
      end
    end
  end
end


