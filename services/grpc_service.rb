require 'grpc'

module Services
  class GrpcService
    def run

    end
  end
end

# https://github.com/grpc/grpc/blob/v1.19.0/examples/ruby/greeter_server.rb#L36-L46
s = GRPC::RpcServer.new
s.add_http2_port('0.0.0.0:50051', :this_port_is_insecure)
s.handle(Services::GrpcService)
# Runs the server with SIGHUP, SIGINT and SIGQUIT signal handlers to
#   gracefully shutdown.
# User could also choose to run server via call to run_till_terminated
s.run_till_terminated_or_interrupted([1, 'int', 'SIGQUIT'])
