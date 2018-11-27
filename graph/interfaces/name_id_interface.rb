module NameIdInterface
  include GraphQL::Schema::Interface

  field :id, Integer, null: false
  field :name, String, null: false
end
