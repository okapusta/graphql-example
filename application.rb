require 'bundler'

Bundler.require

require './lib/database'

DB = Database.establish_connection

require './app/models/user'

class GraphQLExample < Sinatra::Base
  post "/graph" do
    "hello love!"
  end
end
