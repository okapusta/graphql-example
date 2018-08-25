module Graph
  module Types
    class UserType < BaseType
      field :email, String
      field :handle, String

      field :festivals, [Types::FestivalType]
    end
  end
end
