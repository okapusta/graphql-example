require 'bundler'

Bundler.require

require './lib/database'
require './lib/core_ext/hash'

DB = Database.establish_connection


require './app/models/user'
require './app/models/festival'

require './graph/types/base_type'
require './graph/types/user_type'
require './graph/resolvers/base_resolver'
require './graph/resolvers/user_resolver'

require './graph/types/query_type'
require './graph/schema'

class GraphQLExample < Sinatra::Base
  use Rack::PostBodyContentTypeParser
  use Rack::Cors do
    allow do
      origins 'localhost:4000'
      resource '*', :headers => :any,
        :methods => [:post, :options], credentials: true
    end
  end

  post "/graph" do
    result = Graph::GraphQLExampleSchema.execute(params[:query])

    content_type :json

    halt(200, {}, result.to_json)
  end
end
