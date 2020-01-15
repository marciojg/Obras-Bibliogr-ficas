RSpec.describe AuthorNameService do
  describe '#convert' do
    it 'Retornar um nome de autor' do
      mock_of_names_and_author_names = [
        ['João da Silva', 'SILVA, João da'],
        ['Joao Silva', 'SILVA, Joao'],
        ['Paulo Coelho', 'COELHO, Paulo'],
        ['Celso de Araujo', 'ARAUJO, Celso de'],
        ['Luiz Felipe Neto', 'FELIPE NETO, Luiz'],
        ['paulo CARLOS', 'CARLOS, Paulo'],
        ['joao JoAqUim', 'JOAQUIM, Joao'],
        [' Guimaraes', ' GUIMARAES']
      ]

      autor_name = AuthorNameService.new

      mock_of_names_and_author_names.each do |mock|
        expect(autor_name.convert(mock[0])).to eq(mock[1])
      end
    end
  end

  # describe '#slice_full_name' do
  #   it 'Retornar um array onde cada elemento é um nome da pessoa' do
  #     autor_name = AuthorNameService.new
  #     autor_name.convert('Marcio de Jesus')
  #     expect(autor_name.slice_full_name).to eq(['Marcio', 'de', 'Jesus'])
  #   end
  # end
end
