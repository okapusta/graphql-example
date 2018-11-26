require 'ostruct'

module Graph
  module Types
    class QueryType < BaseType
      field :users, [Types::UserType], resolver: Resolvers::UsersResolver
      field :user, Types::UserType, resolver: Resolvers::UserResolver
      field :festival, Types::FestivalType, resolver: Resolvers::FestivalsResolver

      field :lambda, [Types::UserType], resolve: -> (obj, args, ctx) {
          [OpenStruct.new({
            email: 'stefan@example.com',
            handle: 'stefan'
          })]
        }
    end
  end
end
