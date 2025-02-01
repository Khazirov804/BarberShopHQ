require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, { adapter: "sqlite3", database: "barbershop.db" } # установка базы данных

class Client < ActiveRecord::Base # модель класс с помощь которого мы обращаемся через activerecord к базе данных
end

class Barber < ActiveRecord::Base
end

before do
	@barbers = Barber.all
end

get '/' do
	erb :index
end

get '/visit' do
	erb :visit
end

post '/visit' do
	@username = params[:username]
	@phone = params[:phone]
	@datetime = params[:datetime]
	@barber = params[:barber]
	@color = params[:color]

	c = Client.new
	c.name = @username
	c.phone = @phone
	c.datestamp = @datetime
	c.barber = @barber
	c.color = @color
	c.save

	erb "<h2> Спасибо, вы записались! </h2>"
end
