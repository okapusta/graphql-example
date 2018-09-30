module Graph
  module Mutations
    class FestivalMutation < BaseMutation
      argument :name, String, required: true
      argument :place, String, required: true
      argument :user_id, Integer, required: false

      field :festival, Types::FestivalType, null: true

      def resolve(name:, place:, user_id: nil)
        festival = Festival.create(name: name, place: place)
        if user_id
          user = User.find(user_id).last # ???
          add_festival(user, festival)
        end
        {
          festival: festival
        }
      end

      private

      def add_festival(user, festival)
        user.add_festival(festival)
      end
    end
  end
end
