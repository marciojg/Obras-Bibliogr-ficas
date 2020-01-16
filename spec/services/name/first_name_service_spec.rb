# -*- encoding : utf-8 -*-
RSpec.describe Name::FirstNameService do
  describe "#transform" do
    it "deve receber um nome e retorna-lo com primeira letra maíuscula" do
      expect(Name::FirstNameService.transform('teste')).to eq('Teste')
      expect(Name::FirstNameService.transform('teste de')).to eq('Teste de')
    end
  end
end
