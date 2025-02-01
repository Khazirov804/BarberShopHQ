require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'

set :database, { adapter: "sqlite3", database: "barbershop.db" } # установка базы данных

class Client < ActiveRecord::Base # модель класс с помощь которого мы обращаемся через activerecord к базе данных
	validates :name, presence: true
	validates :phone, presence: true
	validates :datestamp, presence: true
	validates :color, presence: true
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

	c = Client.new params[:client]
	c.save

	erb "<h2> Спасибо, вы записались! </h2>"
end
