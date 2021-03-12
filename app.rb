require 'sinatra'
require 'pg'
require 'json'
require 'sinatra/activerecord'
require './config/environments'
require './models/item'


set :bind, '0.0.0.0'
set :port, 8080

get '/' do
    erb :index
end

post '/submit' do
	@item = Item.new(params[:item])
	if @item.save
		redirect '/models'
	else
		"Error: ActiveRecords could not save entry!"
	end
end

get '/models' do
	@items = Item.all
	erb :model
end
