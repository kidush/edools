module Edools
  class Media
    include Edools::ApiBaseRequest

    def self.show(id)
      response = conn.get '/media/', { id: id }

      response.body
    end
  end
end
