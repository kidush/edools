module Edools
  class SchoolProduct
    include Edools::ApiBaseRequest

    def self.create(params = {})
      response = conn.post '/school_products', {school_product: params}

      response.body
    end
    
    def self.all
      response = conn.get '/school_products'

      response.body
    end
  end
end
