module Graph
  class GraphQLExampleSchema < GraphQL::Schema
    query Types::QueryType
    mutation Types::MutationType
  end
end
