module Graph
  module Resolvers
    class BaseResolver < GraphQL::Schema::Resolver
      def self.type(new_type = nil, null: true)
        super
      end
    end
  end
end
