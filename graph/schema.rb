require_relative './analytics/appoptics'

module Graph
  class GraphQLExampleSchema < GraphQL::Schema
    query Types::QueryType
    mutation Types::MutationType

    tracer Graph::Analytics::Appoptics
  end
end
