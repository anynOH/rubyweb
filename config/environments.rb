#The environment variable DATABASE_URL should be in the following format:
# => postgres://{user}:{password}@{host}:{port}/path
configure :production, :development do
	db = URI.parse(ENV['DATABASE_URL'] || 'postgres://localhost/example')

	ActiveRecord::Base.establish_connection(
			:adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
			:host     => db.host,
			:username => db.user,
			:password => db.password,
			:database => db.path[1..-1],
			:encoding => 'utf8'
	)

    
    #ActiveRecord::Migration.class_eval do
    #    create_table :items do |item|
    #          item.string  :name
    #     end
    #end
end