require 'sinatra'
require 'pg'
require 'json'


set :bind, '0.0.0.0'
set :port, 8080

configure do
	SE = JSON.parse(ENV['VCAP_SERVICES'], object_class: OpenStruct)

	#CONN = PG.connect(dbname: ENV['DB_NAME'])
end

=begin
helpers do
	def selectrequest
		res = CONN.exec('SELECT * FROM entries')
		return res.values
	end
	
	def newvalue(value)
		CONN.exec("INSERT INTO entries(\"name\") VALUES(\'#{value}\')")
	end
end
=end

get '/' do
    res = SE.a9s_postgresql11
end

post '/submit' do
	#@new = newvalue(params[:model])
	#redirect '/models'
	"Hello World"
end

get '/models' do
	#@models = selectrequest
	#erb :model
	"Hello World 2"
end
