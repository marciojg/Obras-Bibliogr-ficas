# -*- encoding : utf-8 -*-
module Name::FirstNameService
  class << self
    def transform(name)
      name.to_s.capitalize
    end
  end
end
