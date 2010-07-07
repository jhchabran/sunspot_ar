require 'rubygems'
require 'activerecord'
require 'sunspot'
require 'sunspot_ar/configuration'
require 'sunspot_ar/adapters'
require 'sunspot_ar/searchable'

Sunspot::Adapters::InstanceAdapter.register(Sunspot::Rails::Adapters::ActiveRecordInstanceAdapter, ActiveRecord::Base)
Sunspot::Adapters::DataAccessor.register(Sunspot::Rails::Adapters::ActiveRecordDataAccessor, ActiveRecord::Base)

unless Sunspot::ActiveRecord.config.disabled
  ActiveRecord::Base.module_eval { include(Sunspot::Rails::Searchable) }
end
