require_relative '../lib/redis_connector'
require 'securerandom'

require 'appoptics_apm'

class MyHardWorker
  class SomeDumbException < StandardError; end;

  SLEEP_INTERVAL = 0.1
  REDIS_KEY = %(worker-reports)

  def run
    loop do
      AppOpticsAPM::SDK.trace('worker-layer', {}) do
        begin
          key = rand(10_000)
          if !(key % 10 == 0)
            do_redis_stuff
          else
            fuck_up!
          end
          wait
        rescue => e
          AppOpticsAPM::API.log_exception('worker-layer', e, {})
        end
      end
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
