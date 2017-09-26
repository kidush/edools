module Edools
  class School
    include Edools::ApiBaseRequest

    def self.create(name, email, password)
      response = conn.post '/schools/wizard', { school: {name: name, email: email, password: password} }

      response.body
    end

    def self.update(id, params = {})
      response = conn.put do |req|
        req.url "/schools/#{id}"
        req.body = {school: params}
      end

      response.body
    end

    def self.all
      response = conn.get '/schools'
      response.body
    end

  end
end
