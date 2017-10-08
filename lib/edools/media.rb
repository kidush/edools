module Edools
  class Media
    include Edools::ApiBaseRequest

    def self.find(id)
      response = conn.get '/media/', { id: id }

      Edools.config.media_csv = response.body["media"].first["s3_file_url"] if response.status == 200

      response.body
    end
  end
end
