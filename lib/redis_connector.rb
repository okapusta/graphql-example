require 'redis'
require 'singleton'

class RedisConnector
  include Singleton

  def get(key)
    connection.get(key)
  end

  def set(key, value)
    connection.set(key, value)
  end

  def fetch(key, &block)
    return unless block_given?

    if value = get(key)
      return value
    end
    set(key, yield)
  end

  private

  def connection
    @connection ||= Redis.new(url: 'redis://redis:6379/0')
  end
end
