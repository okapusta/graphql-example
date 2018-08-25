module Graph
  module Resolvers
    class UserResolver < BaseResolver
      type [Types::UserType]

      def resolve
        User.all
      end
    end
  end
end
