module Edools
  class Config
    attr_accessor :api_key, :base_uri    

    def initialize(api_key, base_uri)
      @api_key = api_key
      @base_uri = base_uri
    end
  end
end
