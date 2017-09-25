module Edools
  module School

    def self.create(school = {})
      @conn = Faraday.new(url: @config.base_uri)
      params = {}
      params.merge(school: school)

      resp = @conn.post do |req|
        req.url '/schools'
        req.headers['Authentication'] = "Token token=#{@config.api_key}"
        req.body = school.to_json
      end

      resp
    end
  end
end
