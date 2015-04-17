require 'active_record'

local_db = {
	:adapter => 'postgresql',
	:database => 'project_2'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || local_db)