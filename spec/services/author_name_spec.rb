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

    it 'Retornar um nome de autor com sobrenome em letras mai?sculas, seguido de uma v?rgula e da primeira parte do nome apenas com as iniciais mai?sculas' do
      mock_of_names_and_author_names.each do |mock|
        expect(AuthorNameService.change_for_author_name(mock[0])).to eq(mock[1])
      end
    end
  end

  describe 'Regras de formata??es b?sicas' do
    it 'o sobrenome ser?o igual a ?ltima parte do nome e deve ser apresentado em letras mai?sculas' do
      expect(AuthorNameService.change_for_author_name('Fernando Paulo')).to eq('PAULO, Fernando')
      expect(AuthorNameService.change_for_author_name('Fernando Jo?o da Silva Paulo')).to eq('PAULO, Fernando')
    end

    it 'se houver apenas uma parte no nome, ela deve ser apresentada em letras mai?sculas (sem v?rgula)' do
      expect(AuthorNameService.change_for_author_name('Guimaraes')).to eq('GUIMARAES')
      expect(AuthorNameService.change_for_author_name(' guimaraes')).to eq(' GUIMARAES')
    end

    it 'se a ?ltima parte do nome for igual a "FILHO", "FILHA", "NETO", "NETA", "SOBRINHO", "SOBRINHA" ou "JUNIOR" e houver duas ou mais partes antes, a pun?ltima parte far? parte do sobrenome.' do
      expect(AuthorNameService.change_for_author_name('Joao Silva Neto')).to eq('SILVA NETO, Joao')
      expect(AuthorNameService.change_for_author_name('Joao Neto')).to eq('NETO, Joao')
    end

    it 'as partes do nome que n?o fazem parte do sobrenome devem ser impressas com a inicial mai?scula e com as demais letras mai?scula;' do
      conterted_name = AuthorNameService.change_for_author_name('Joao Silva Neto')

      expect(conterted_name.split(' ').last).to eq('Joao')
    end

    it '"da", "de", "do", "das", "dos" n?o fazem parte do sobrenome e n?o iniciam por letra mai?scula.' do
      conterted_name = AuthorNameService.change_for_author_name('Joao da Silva')
      last_element_of_converted_name = conterted_name.split(' ').last

      expect(last_element_of_converted_name).to eq('da')
      expect(last_element_of_converted_name).not_to eq('Da')
    end
  end
end
