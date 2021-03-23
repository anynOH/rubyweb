require 'sinatra'
require "pstore"
require 'yaml'


set :bind, '0.0.0.0'


configure do
	thing = YAML.load_file('config.yml')
	puts thing["port"]
	set :port, thing["port"]

	Item = PStore.new("items.pstore")

	def write(key, value)
		Item.transaction do
		  Item[key] = value
		end
	  end

	def readAll()
		values = []
		Item.transaction do
			Item.roots.each do |data_root_name|
				values << (data_root_name.to_s + ' : ' + Item[data_root_name])
			end
		end
		return values
	end

	def delete(key)
		Item.transaction { Item.delete[key] }
	end
end

get '/' do
	readAll().join("\n")
end

post '/submit' do
	params.each do |key, value|
		write(key, value)
	end
	"Success"
end

