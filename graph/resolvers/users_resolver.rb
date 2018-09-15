module Graph
  module Resolvers
    class UsersResolver < BaseResolver
      type [Types::UserType]

      def resolve
        User.all
      end
    end
  end
end
