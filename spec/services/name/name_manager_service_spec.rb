# -*- encoding : utf-8 -*-
RSpec.describe Name::NameManagerService do
  describe "#transform" do
    it "deve receber um nome e o tipo de conversão e retornar com a conversão correspondente" do
      expect(Name::NameManagerService.transform('teste', Name::SurnameService.itself)).to eq('TESTE')
      expect(Name::NameManagerService.transform('teste de', Name::FirstNameService.itself)).to eq('Teste de')
    end
  end
end
