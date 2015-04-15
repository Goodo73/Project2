class Book < ActiveRecord::Base
	belongs_to :genre
	belongs_to :format
	belongs_to :category
end