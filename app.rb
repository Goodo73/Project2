require 'sinatra'
require 'sinatra/reloader'
require 'httparty'
require 'pry'

require_relative 'config'
require_relative 'book'

get '/' do
	"ready to go"
	# erb :index
end