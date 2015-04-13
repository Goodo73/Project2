require 'sinatra'
require 'sinatra/reloader'
# require 'httparty'
require 'pry'

require_relative 'config'
require_relative 'book'

after do
  ActiveRecord::Base.connection.close
end

get '/' do
	@books = Book.all

  erb :index
end

get '/about' do
	erb :about
end
