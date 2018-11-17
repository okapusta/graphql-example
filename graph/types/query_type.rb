module Graph
  module Types
    class QueryType < BaseType
      field :users, [Types::UserType], resolver: Resolvers::UsersResolver
      field :user, Types::UserType, resolver: Resolvers::UserResolver
      field :festival, Types::FestivalType, resolver: Resolvers::FestivalsResolver
    end
  end
end
