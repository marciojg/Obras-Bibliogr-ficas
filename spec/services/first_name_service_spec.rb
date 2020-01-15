RSpec.describe FirstNameService do
  describe "#covert" do
    it "deve receber um nome e retorna-lo com primeira letra maíuscula" do
      expect(FirstNameService.convert('teste')).to eq('Teste')
      expect(FirstNameService.convert('teste de')).to eq('Teste de')
    end
  end
end
