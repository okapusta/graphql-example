class User < Sequel::Model
  # TODO: Authentication
  many_to_many :festivals
end
