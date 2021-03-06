require 'sinatra'

require 'pg'
require 'active_record'
# require 'sinatra/reloader'

require_relative 'book'
require_relative 'genre'
require_relative 'format'
require_relative 'category'


local_db = {
  :adapter => 'postgresql',
  :database => 'project_2'
}

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'] || local_db)

after do
  ActiveRecord::Base.connection.close
end

get '/' do
  @books = Book.all.order('title')
  @genres = Genre.all.order('name')
  @formats = Format.all.order('name')
  @categories = Category.all.order('name')

  erb :index
end

# Retrieve all books, ordered by title
get '/api/books' do
  books = Book.all.order('title')
  content_type :json
  books.to_json(:include => [:genre, :format, :category])
end

# Retrieve books, filtered by criteria, ordered by title
get '/api/books/filter' do
  books = Book.all.order('title')

  if params[:genre] && !params[:genre].empty?
    books = books.where(genre_id: params[:genre])
  end

  if params[:category] && !params[:category].empty?
    books = books.where(category_id: params[:category])
  end

  if params[:format] && !params[:format].empty?
    books = books.where(format_id: params[:format])
  end
  
  if params[:loan] && params[:loan] == '1'
    books = books.loaned
  elsif params[:loan] && params[:loan] == '0'
    books = books.unloaned
  end
  content_type :json
  books.to_json(:include => [:genre, :format, :category])
end

# Retrieve specific book by id
get '/api/books/:id' do
  book = Book.find(params[:id])
  content_type :json
  book.to_json(:include => [:genre, :format, :category])
end

# Retrieve all genres, ordered by name
get '/api/genres' do
  genres = Genre.all.order('name')
  content_type :json
  genres.to_json
end

# Retrieve all categories, ordered by name
get '/api/categories' do
  categories = Category.all.order('name')
  content_type :json
  categories.to_json
end

# Retrieve all formats, ordered by name
get '/api/formats' do
  formats = Format.all.order('name')
  content_type :json
  formats.to_json
end

# Delete a specific book by id
delete '/books/:id/delete' do
  Book.find(params[:id]).delete
end

# Update a specific book by id
put '/books/:id' do
  book = Book.find(params[:id])

  book.title = params[:title]
  book.author = params[:author]
  book.genre_id = Genre.find_by(name: params[:genre]).id
  book.category_id = Category.find_by(name: params[:category]).id
  book.format_id = Format.find_by(name: params[:format]).id
  book.loaned_to = params[:loan]
  book.save

  content_type :json
  book.to_json(:include => [:genre, :format, :category])
end

# Insert a new book
post '/books/add' do
  book = Book.new
  book.title = params[:title]
  book.author = params[:author]
  book.genre_id = Genre.find_by(name: params[:genre]).id
  book.category_id = Category.find_by(name: params[:category]).id
  book.format_id = Format.find_by(name: params[:format]).id
  book.loaned_to = params[:loan]
  book.save

  content_type :json
  book.to_json(:include => [:genre, :format, :category])
end

get '/about' do
  erb :about
end
