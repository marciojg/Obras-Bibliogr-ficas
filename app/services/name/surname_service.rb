# -*- encoding : utf-8 -*-
module Name::SurnameService
  class << self
    def transform(lastname)
      lastname.to_s.upcase
    end
  end
end
