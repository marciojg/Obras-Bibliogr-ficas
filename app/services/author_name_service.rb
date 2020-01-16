module AuthorNameService
  class << self

    BLANK_SPACE = ' '
    LAST_NAME_EXCEPTIONS = %w[da de do das dos]

    private_constant :BLANK_SPACE, :LAST_NAME_EXCEPTIONS

    def convert(nome_recebido)
      nome_recebido_como_array = nome_recebido.split

      return LastNameService.convert(nome_recebido) unless nome_recebido_como_array.count > 1

      first_name_as_array = []

      # posso usar regex
      if nome_recebido_como_array[1].in?(LAST_NAME_EXCEPTIONS)
        first_name_as_array << nome_recebido_como_array[0]
        first_name_as_array << nome_recebido_como_array[1]
      else
        first_name_as_array << nome_recebido_como_array[0]
      end

      nome_recebido_como_array.reject! { |element| element.in?(first_name_as_array) }

      nome_convertido = ''
      nome_recebido_como_array.each_with_index do |element, index|
        concatenar_com = index == (nome_recebido_como_array.length - 1) ? ', ' : BLANK_SPACE
        nome_convertido.concat(LastNameService.convert(element), concatenar_com)
      end

      nome_convertido.concat(FirstNameService.convert(first_name_as_array.join(BLANK_SPACE)))
    end
  end
end
