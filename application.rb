require 'bundler'

Bundler.require

require './lib/database'

DB = Database.establish_connection

require './app/models/user'
require './app/models/festival'

class GraphQLExample < Sinatra::Base
  post "/graph" do
    result = Graph::GraphQLExampleSchema.execute(params[:query])

    content_type :json

    halt(200, {}, json_enc(result))
  end
end
