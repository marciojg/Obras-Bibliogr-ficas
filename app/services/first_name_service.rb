# -*- encoding : utf-8 -*-
module FirstNameService
  class << self
    def convert(name)
      name.to_s.capitalize
    end
  end
end
