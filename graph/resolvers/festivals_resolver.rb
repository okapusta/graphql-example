module Graph
  module Resolvers
    class FestivalsResolver < BaseResolver
      argument :id, Integer, required: false

      def resolve(id: nil)
        puts "resolve #{id}"
        if id
          Festival.find(id: id)
        else
          Festival.all
        end
      end
    end
  end
end
