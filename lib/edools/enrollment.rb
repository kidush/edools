module Edools
  class Enrollment
    include Edools::ApiBaseRequest

    def self.create(params = {})
      response = conn.post '/enrollments', { enrollment: params }

      response.body
    end
  end
end
