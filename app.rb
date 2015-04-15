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
	@genres = Genre.all
	@formats = Format.all
	@categories = Category.all

  erb :index
end

get '/api/books' do
	books = Book.all
	content_type :json
	books.to_json
end

get '/api/books/:id' do
	book = Book.find(params[:id])
	content_type :json
	book.to_json(:include => [:genre, :format, :category])

	# binding.pry
end

get '/api/genres' do
	genres = Genre.all
	content_type :json
	genres.to_json
end

get '/api/formats' do
	formats = Format.all
	content_type :json
	formats.to_json
end

get '/api/categories' do
	categories = Category.all
	content_type :json
	categories.to_json
end

delete '/books/:id/delete' do
	Book.find(params[:id]).delete

	redirect to '/'
end

post '/api/books' do
	book = Book.new
	book.title = # params[:title]
	book.author = #
	book.genre = #
	book.format = #
	book.category = #
	book.loaned_to = #
	book.save

	content_type :json
	book.to_json
end

get '/about' do
	erb :about
end


