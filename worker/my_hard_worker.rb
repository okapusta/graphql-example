require_relative '../lib/redis_connector'
require 'securerandom'

class MyHardWorker
  class SomeDumbException < StandardError; end;

  SLEEP_INTERVAL = 0.1

  def run
    loop do
      do_redis_stuff

      wait
    end
  end

  private

  def do_redis_stuff
    puts "majonez"
    key = rand(10_000)
    if !(key % 10 == 0)
      RedisConnector.instance.fetch(key) do
        SecureRandom.hex
      end
    else
      fuck_up!
    end
  end

  def wait
    sleep(rand(SLEEP_INTERVAL))
  end

  def fuck_up!
    raise SomeDumbException, "OH SNAP!"
  end

end

MyHardWorker.new.run
