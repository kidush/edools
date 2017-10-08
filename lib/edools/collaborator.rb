module Edools
  class Collaborator
    include Edools::ApiBaseRequest

    def self.create(params = {})
      response = conn.post '/collaborators', { user: params }

      response.body
    end

    def self.all(params = {})
      response = conn.get '/collaborators', params

      response.body
    end
  end
end
