module Graph
  module Types
    class FestivalType < BaseType
      implements Graph::Interfaces::NameIdInterface

      field :place, String

      field :artists, [Types::ArtistType]
    end
  end
end
