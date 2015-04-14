require 'sinatra'
require 'sinatra/reloader'
# require 'httparty'
require 'pry'

require_relative 'config'
require_relative 'book'
require_relative 'genre'
require_relative 'format'
require_relative 'category'


after do
  ActiveRecord::Base.connection.close
end

get '/' do
	@books = Book.all
	# @genres = Genre.all

  erb :index
end

# get '/book/knights' do
# 	@data = "Knights"
# end

get '/api/books' do
	books = Book.all
	content_type :json
	books.to_json
end

get '/api/genres' do
	genres = Genre.all
	content_type :json
	genres.to_json
end

get '/api/formats' do
	genres = Format.all
	content_type :json
	genres.to_json
end

get '/api/categories' do
	genres = Category.all
	content_type :json
	genres.to_json
end

get '/about' do
	erb :about
end
