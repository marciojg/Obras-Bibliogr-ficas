module LastNameService
  class << self
    def convert(lastname)
      lastname.to_s.upcase
    end
  end
end
