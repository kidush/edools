module Edools
  class Invitation
    include Edools::ApiBaseRequest

    def self.create(params = {})
      response = conn.post '/invitations', { invitation: params }

      response.body
    end
  end
end
