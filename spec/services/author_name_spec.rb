# -*- encoding : utf-8 -*-

RSpec.describe AuthorNameService do

  let(:mock_of_names_and_author_names) {
    [
      ['Joao da Silva', 'SILVA, Joao da'],
      ['Joao Silva', 'SILVA, Joao'],
      ['Paulo Coelho', 'COELHO, Paulo'],
      ['Celso de Araujo', 'ARAUJO, Celso de'],
      ['Luiz Felipe Neto', 'FELIPE NETO, Luiz'],
      ['paulo CARLOS', 'CARLOS, Paulo'],
      ['joao JoAqUim', 'JOAQUIM, Joao'],
      [' Guimaraes', ' GUIMARAES'],
      ['Marcio de Jesus Goncalves da Silva', 'SILVA, Marcio de'],
      ['Fernando Diego da Marques', 'MARQUES, Fernando'],
      ['Joao do Neto', 'NETO, Joao do']
    ]
  }

  describe '#change_for_author_name' do
    it 'Dever receber uma string como parametro' do
      expect { AuthorNameService.change_for_author_name(2) }.to raise_exception(TypeError)
    end

    it 'Retornar um nome de autor com sobrenome em letras maiúsculas, seguido de uma vírgula e da primeira parte do nome apenas com as iniciais maiúsculas' do
      mock_of_names_and_author_names.each do |mock|
        expect(AuthorNameService.change_for_author_name(mock[0])).to eq(mock[1])
      end
    end
  end

  describe 'Regras de formatações básicas' do
    it 'o sobrenome sério igual a última parte do nome e deve ser apresentado em letras maiúsculas' do
      expect(AuthorNameService.change_for_author_name('Fernando Paulo')).to eq('PAULO, Fernando')
      expect(AuthorNameService.change_for_author_name('Fernando Jo?o da Silva Paulo')).to eq('PAULO, Fernando')
    end

    it 'se houver apenas uma parte no nome, ela deve ser apresentada em letras maiúsculas (sem vírgula)' do
      expect(AuthorNameService.change_for_author_name('Guimaraes')).to eq('GUIMARAES')
      expect(AuthorNameService.change_for_author_name(' guimaraes')).to eq(' GUIMARAES')
    end

    it 'se a ?ltima parte do nome for igual a "FILHO", "FILHA", "NETO", "NETA", "SOBRINHO", "SOBRINHA" ou "JUNIOR" e houver duas ou mais partes antes, a pun?ltima parte far? parte do sobrenome.' do
      expect(AuthorNameService.change_for_author_name('Joao Silva Neto')).to eq('SILVA NETO, Joao')
      expect(AuthorNameService.change_for_author_name('Joao Neto')).to eq('NETO, Joao')
    end

    it 'as partes do nome que não fazem parte do sobrenome devem ser impressas com a inicial maiúscula e com as demais letras maiúscula;' do
      conterted_name = AuthorNameService.change_for_author_name('Joao Silva Neto')

      expect(conterted_name.split(' ').last).to eq('Joao')
    end

    it '"da", "de", "do", "das", "dos" não fazem parte do sobrenome e não iniciam por letra maiúscula.' do
      conterted_name = AuthorNameService.change_for_author_name('Joao da Silva')
      last_element_of_converted_name = conterted_name.split(' ').last

      expect(last_element_of_converted_name).to eq('da')
      expect(last_element_of_converted_name).not_to eq('Da')
    end
  end
end
