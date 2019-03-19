require 'grpc'

require_relative './proto/worker_messages_service_services_pb'
require_relative '../lib/redis_connector'

module Services
  class WorkerGrpcService < WorkerMessages::Service
    REDIS_KEY = %(worker-reports)

    def recent_reports(request, _unused_call)
      count = request.count - 1
      redis_response = RedisConnector.instance.lrange(REDIS_KEY, 0, count)
      reports = redis_response.map do |message|
        WorkerReport.new(message: message )
      end
      WorkerReports.new(reports: reports)
    end
  end
end

# https://github.com/grpc/grpc/blob/v1.19.0/examples/ruby/greeter_server.rb#L36-L46
s = GRPC::RpcServer.new
s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
s.handle(Services::WorkerGrpcService)
# Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to
#   gracefully shutdown.
# User could also choose to run server via call to run_till_terminated
s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
