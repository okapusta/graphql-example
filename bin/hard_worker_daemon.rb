require 'daemons'

path = File.join(File.dirname(__FILE__), '..', 'worker', 'my_hard_worker.rb')

Daemons.run(path)
