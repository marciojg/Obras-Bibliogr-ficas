# -*- encoding : utf-8 -*-
RSpec.describe LastNameService do
  describe "#covert" do
    it "deve receber um sobrenome e retorna-lo todo em maúsculo" do
      expect(LastNameService.convert('teste')).to eq('TESTE')
    end
  end
end
