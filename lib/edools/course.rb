module Edools
  class Course
    include Edools::ApiBaseRequest

    def self.create(params = {})
      response = conn.post '/courses', { course: params }

      response.body
    end

    def self.all
      response = conn.get '/courses'

      response.body
    end
  end
end
