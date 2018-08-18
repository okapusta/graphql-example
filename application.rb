require 'bundler'

Bundler.require

require './lib/database'

DB = Database.establish_connection

require './app/models/user'
require './app/models/festival'

class GraphQLExample < Sinatra::Base
  post "/graph" do
    "hello love!"
  end
end
