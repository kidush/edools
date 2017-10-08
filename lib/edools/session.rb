module Edools
  class Session
    include Edools::ApiBaseRequest

    def self.create(user = {})
      response = conn.post '/users/sign_in', { user: user, realm: { id: user[:id], type: user[:type] } }
      
      Edools.config.session_key = response.body['credentials'] if response.status == 201 or response.status == 200

      response.body
    end

  end
end
