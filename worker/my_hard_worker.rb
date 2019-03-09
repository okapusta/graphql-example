require_relative '../lib/redis_connector'
require 'securerandom'

class MyHardWorker
  class SomeDumbException < StandardError; end;

  SLEEP_INTERVAL = 0.1
  REDIS_KEY = %(worker-reports)

  def run
    loop do
      key = rand(10_000)
      if !(key % 10 == 0)
        do_redis_stuff
      else
        fuck_up!
      end
      wait
    end
  end

  private

  def do_redis_stuff
    RedisConnector.instance.lpush(REDIS_KEY, SecureRandom.hex)
  end

  def wait
    sleep(rand(SLEEP_INTERVAL))
  end

  def fuck_up!
    raise SomeDumbException, "OH SNAP!"
  end

end

MyHardWorker.new.run
