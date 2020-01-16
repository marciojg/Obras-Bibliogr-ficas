# -*- encoding : utf-8 -*-
module Name::NameManagerService
  class << self
    attr_accessor :name
    attr_accessor :piece_name

    def transform(name, piece_name = Name::SurnameService.itself)
      @name = name
      @piece_name = piece_name

      transform_name
    end

    private

    def transform_name
      piece_name.transform name
    end
  end
end
