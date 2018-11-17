module Graph
  module Types
    class FestivalType < BaseType
      field :id, Integer
      field :name, String
      field :place, String

      field :artists, [Types::ArtistType]
    end
  end
end
