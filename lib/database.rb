class Database
  class << self
    def establish_connection
      Sequel.connect(ENV['MYSQL_DATABASE'])
    end
  end
end
