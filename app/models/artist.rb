class Artist < Sequel::Model
  many_to_many :genres
  many_to_many :festivals
  one_to_one   :bio
end
