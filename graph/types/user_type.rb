module Graph
  module Types
    class UserType < BaseType
      field :id, Integer
      field :email, String
      field :handle, String

      field :festivals, [Types::FestivalType]
    end
  end
end
