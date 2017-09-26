module Edools
  module Middlewares
    class HashResponse < Faraday::Middleware
      def call(environment)
        @app.call(environment).on_complete do |env|
          env[:body] = JSON.parse(env[:body])
        end
      end
    end
  end
end

Faraday::Response.register_middleware hashify: Edools::Middlewares::HashResponse
