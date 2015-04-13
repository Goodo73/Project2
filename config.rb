require 'active_record'

activeRecordOptions = {
	:adapter => 'postgresql',
	:database => 'project_2'
}

ActiveRecord::Base.establish_connection(activeRecordOptions)