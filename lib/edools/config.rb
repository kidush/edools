module Edools
  class Config
    attr_accessor :api_key, :base_uri, :admin_key, :session_key, :media_csv
    attr_reader :conn

    def initialize(api_key = nil, base_uri = nil)
      @api_key = api_key
      @base_uri = base_uri

      @conn = Faraday.new(url: base_uri) do |conn|
        conn.request  :url_encoded
        conn.request  :choose_api_key
        conn.response :hashify

        conn.adapter Faraday.default_adapter
      end
    end
  end
end
