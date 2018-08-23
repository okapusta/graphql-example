class Database
  class << self
    def establish_connection(db = nil)
      Sequel.connect(db || ENV['MYSQL_DATABASE'])
    rescue
      puts "Database connection couldn't be established..."
    end
  end
end
