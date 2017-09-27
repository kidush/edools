module Edools
  class Student
    include Edools::ApiBaseRequest

    def self.create(params = {})
      response = conn.post '/students', { user: params }

      response.body
    end

    def self.all(params = {})
      response = conn.get '/students', params

      response.body
    end
  end
end
