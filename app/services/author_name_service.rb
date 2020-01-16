# -*- encoding : utf-8 -*-
module AuthorNameService
  class << self

    attr_accessor :common_name
    attr_accessor :common_name_downcased_as_array

    BLANK_SPACE = ' '
    COMMA_AND_BLANK_SPACE = ",#{BLANK_SPACE}"
    CONJUNCTION_NAME_EXCEPTION = %w[da de do das dos]
    SURNAME_EXCEPTION = %w[filho filha neto neta sobrinho sobrinha junior]

    private_constant :BLANK_SPACE, :CONJUNCTION_NAME_EXCEPTION, :SURNAME_EXCEPTION

    def change_for_author_name(common_name)
      raise TypeError, 'Deve ser passado uma String' if !common_name.is_a?(String)

      @common_name = common_name
      @common_name_downcased_as_array = common_name.downcase.split(BLANK_SPACE)

      generate_author_name
    end

    private

    def generate_author_name
      return transform(common_name, Name::SurnameService.itself) unless has_complete_common_name?

      first_piece_as_downcase = capture_first_piece
      last_piece_as_downcase = capture_last_piece(first_piece_as_downcase)

      transform_in_a_author_name(first_piece_as_downcase, last_piece_as_downcase)
    end

    def capture_first_piece
      first_name_of_first_piece = common_name_downcased_as_array.first
      second_name_of_first_piece = common_name_downcased_as_array.second

      first_piece = [first_name_of_first_piece]

      if second_name_of_first_piece.present? && second_name_of_first_piece.in?(CONJUNCTION_NAME_EXCEPTION)
        first_piece.push(second_name_of_first_piece)
      end

      first_piece
    end

    def capture_last_piece(first_piece_as_downcase)
      surname_piece = common_name_downcased_as_array.delete_if { |common_name| common_name.in?(first_piece_as_downcase) }

      penultimate_name_of_last_piece = surname_piece[-2]
      last_name_of_last_piece = surname_piece.last

      last_piece = [last_name_of_last_piece]

      if penultimate_name_of_last_piece.present? && last_name_of_last_piece.in?(SURNAME_EXCEPTION)
        last_piece.unshift(penultimate_name_of_last_piece)
      end

      last_piece
    end

    def transform(piece_name, type_to_transform)
      Name::NameManagerService.transform piece_name, type_to_transform
    end

    def has_complete_common_name?
      common_name_downcased_as_array.count > 1
    end

    def transform_in_a_author_name(first_piece_as_downcase, last_piece_as_downcase)
      first_name = transform(first_piece_as_downcase.join(BLANK_SPACE), Name::FirstNameService.itself)
      surname = transform(last_piece_as_downcase.join(BLANK_SPACE), Name::SurnameService.itself)

      surname.concat(COMMA_AND_BLANK_SPACE, first_name)
    end
  end
end
