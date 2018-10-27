class Genre < Sequel::Model
  many_to_many :artists
end
