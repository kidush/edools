module Edools
  module ApiBaseRequest

    def self.included(base)
      base.extend(ClassMethods)
    end
    
    module ClassMethods
      def conn
        Edools.config.conn
      end
    end
  end
end
