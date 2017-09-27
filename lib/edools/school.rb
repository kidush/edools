module Edools
  class School
    include Edools::ApiBaseRequest

    def self.create(name, email, password)
      response = conn.post '/schools/wizard', { school: {name: name, email: email, password: password} }

      Edools.config.admin_key = response.body["admin"]["credentials"]

      response.body
    end

    def self.update(id, params = {})
      response = conn.put "/schools/#{id}", { school: params }

      response.body
    end

    def self.all
      response = conn.get '/schools'
      response.body
    end

  end
end
