module Graph
  module Mutations
    class FestivalMutation < BaseMutation
      argument :name, String, required: true
      argument :place, String, required: true
      argument :user_id, Integer, required: false

      field :festival, Types::FestivalType, null: true
      field :errors, [String], null: false

      def resolve(name:, place:, user_id: nil)
        festival = Festival.new(name: name, place: place)
        if festival.save
          if user = User.find(user_id).last
            add_festival(user, festival)
          end
          {
            festival: festival,
            errors: []
          }
        else
          {
            festival: nil,
            errors: festival.errors.full_messages
          }
        end
      end

      private

      def add_festival(user, festival)
        user.add_festival(festival)
      end
    end
  end
end
