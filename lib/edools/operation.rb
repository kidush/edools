module Edools
  class Operation
    def self.save_user_in_mass(url = nil)
      csv_url = Edools.config.media_csv || url 
      users = Edools::DownloadCsv.parse_remote csv_url

      users.each do |user|
        verify_user = if user['type'] == 'Student'
                        Edools::Student.all(full_name: user['email'])
                      else
                        Edools::Collaborator.all(full_name: user['email'])
                      end

        if verify_user['total_count'] == 0
          if user['type'] == 'Student'
            Edools::Student.create(first_name: user['first_name'], email: user['email'], password: '123456', password_confirmation: '123456') 
          else
            Edools::Collaborator.create(first_name: user['first_name'], email: user['email'], password: '123456', password_confirmation: '123456') 
          end
        end
      end
    end
  end
end
