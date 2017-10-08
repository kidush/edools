module  Edools
  module Middlewares
    class ChooseApiKey < Faraday::Middleware
      def call(request_env)
        api_key = choose_key(request_env[:url]) 
        request_env[:request_headers].merge!({'Authorization': "Token token=#{api_key}" })
        @app.call(request_env)
      end

      private 

      def choose_key(url)
        path = url.to_s.split('/')
        if path.last == 'wizard'
          Edools.config.api_key
        else
          Edools.config.admin_key || Edools.config.session_key
        end
      end
    end
  end
end

Faraday::Request.register_middleware choose_api_key: Edools::Middlewares::ChooseApiKey
