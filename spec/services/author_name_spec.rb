RSpec.describe AuthorNameService do

  let(:mock_of_names_and_author_names) {
    [
      ['João da Silva', 'SILVA, João da'],
      ['Joao Silva', 'SILVA, Joao'],
      ['Paulo Coelho', 'COELHO, Paulo'],
      ['Celso de Araujo', 'ARAUJO, Celso de'],
      ['Luiz Felipe Neto', 'FELIPE NETO, Luiz'],
      ['paulo CARLOS', 'CARLOS, Paulo'],
      ['joao JoAqUim', 'JOAQUIM, Joao'],
      [' Guimaraes', ' GUIMARAES']
    ]
  }

  describe '#convert' do
    it 'Retornar um nome de autor' do
      mock_of_names_and_author_names.each do |mock|
        expect(AuthorNameService.convert(mock[0])).to eq(mock[1])
      end
    end
  end
end
