require 'bundler'

Bundler.require

require './lib/database'
require './lib/core_ext/hash'

DB = Database.establish_connection

require './app/models/user'
require './app/models/festival'
require './app/models/artist'
require './app/models/genre'
require './app/models/bio'

require './graph/types/base_type'
require './graph/types/artist_type'
require './graph/types/festival_type'
require './graph/types/user_type'
require './graph/resolvers/base_resolver'
require './graph/resolvers/users_resolver'
require './graph/resolvers/user_resolver'
require './graph/resolvers/festivals_resolver'

require './graph/mutations/base_mutation'
require './graph/mutations/festival_mutation'

require './graph/interfaces/name_id_interface'

require './graph/types/query_type'
require './graph/types/mutation_type'
require './graph/schema'

class GraphQLExample < Sinatra::Base
  use Rack::PostBodyContentTypeParser
  use Rack::Cors do
    allow do
      origins %w(localhost:4000) # graphiql
      resource '*', :headers => :any,
        :methods => [:post, :options], credentials: true
    end
  end

  set :static, :enable

  post "/graph" do
    result = Graph::GraphQLExampleSchema.execute(params[:query], {
      variables: params[:variables]
    })

    content_type :json

    halt(200, {}, result.to_json)
  end
end
