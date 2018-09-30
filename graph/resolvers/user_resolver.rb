module Graph
  module Resolvers
    class UserResolver < BaseResolver
      type Types::UserType

      argument :id, Integer, required: true

      def resolve(id: nil)
        User.find(id: id)
      end
    end
  end
end
