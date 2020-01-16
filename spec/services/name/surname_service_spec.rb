# -*- encoding : utf-8 -*-
RSpec.describe Name::SurnameService do
  describe "#transform" do
    it "deve receber um sobrenome e retorna-lo todo em maúsculo" do
      expect(Name::SurnameService.transform('teste')).to eq('TESTE')
    end
  end
end
