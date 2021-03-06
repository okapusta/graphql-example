require './services/proto/worker_messages_service_services_pb'

module Graph
  module Resolvers
    class WorkerMessagesResolver < BaseResolver
      RECENT_MESSAGES_COUNT = 10

      type [Types::WorkerMessageType]

      def resolve
        connection.recent_reports(request).reports
      end

      private

      def connection
        WorkerMessages::Stub.new('service:50051', :this_channel_is_insecure)
      end

      def request
        WorkerReportsRequest.new(count: RECENT_MESSAGES_COUNT)
      end
    end
  end
end
