module Edools
  class Config
    def initialize(api_key = nil, base_uri = nil)
      @api_key = api_key
      @base_uri = base_uri

      @conn = Faraday.new(url: base_uri, headers: {'Authentication': "Token token=#{api_key}"}) 
    end

    attr_accessor :api_key, :base_uri
    attr_reader :conn
  end
end
