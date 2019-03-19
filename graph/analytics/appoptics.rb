require 'appoptics_apm'

module Graph
  module Analytics
    class Appoptics
      def self.trace(key, metadata)
        AppOpticsAPM::SDK.trace('graph', metadata) do
          yield
        end
      end
    end
  end
end
