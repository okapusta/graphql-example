module Graph
  module Types
    class MutationType < BaseType
      field :addFestival, mutation: Graph::Mutations::FestivalMutation
    end
  end
end
