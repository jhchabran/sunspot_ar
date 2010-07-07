require 'rubygems'
require 'activerecord'
require 'sunspot'
require 'sunspot_ar/configuration'
require 'sunspot_ar/adapters'
require 'sunspot_ar/searchable'

Sunspot::Adapters::InstanceAdapter.register(Sunspot::ActiveRecord::Adapters::ActiveRecordInstanceAdapter, ActiveRecord::Base)
Sunspot::Adapters::DataAccessor.register(Sunspot::ActiveRecord::Adapters::ActiveRecordDataAccessor, ActiveRecord::Base)


ActiveRecord::Base.module_eval { include(Sunspot::ActiveRecord::Searchable) }

