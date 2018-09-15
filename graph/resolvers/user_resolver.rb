module Graph
  module Resolvers
    class UserResolver < BaseResolver
      type Types::UserType

      argument :id, Integer, required: true

      def resolve(id: nil)
        puts "majonez #{id}"
        User.find(id: id)
      end
    end
  end
end
