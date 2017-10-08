require 'csv'

module Edools
  class DownloadCsv

    def self.parse_remote(url)
      response = Faraday.get url
      csv_string = CSV.parse(response.body).flatten
             
      keys = csv_string.first.split(';')

      csv_string.shift

      csv_string.map{|el| Hash[keys.zip(el.split(';'))]}
    end


  end
end
