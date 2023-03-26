# Obras Bibliográficas

# Problema proposto

O detalhes do problma proposto pode ser encontrado (aqui)[./TESTE_RUBY.md]

## O que foi usado
- Ruby 2.6.5
- Rails API 6
- Docker CE
- Docker Compose
- Postman

Esta aplicação foi desenvolvida utilizando a técnica de TDD com baby-steps. Onde procurei fazer um código de fácil leitura e modificação posterior, para atingir este objetivo programei orientado aos preceitos do SOLID e fazendo uso de "Design Patterns" como o padrão Injeção de Dependência por exemplo.

## Para testar a aplicação é necessário seguir os passos abaixo

### Subir a aplicação
```bash
docker-compose up --build -d
```

  #### A) Rodando os testes via RSpec
```bash
docker-compose exec application rspec
```

#### B) Rodar a aplicação e testar o funcionamento da API com PostMan

    - Para isso é necessário subir o docker compose (docker-compose up -d) que irá subir a aplicação no endereço http://localhost:3000
    - Abir o software Postman -> Criar uma nova aba -> E prencher os campos:
      - Endereço: http://localhost:3000/api/v1/authors
      - Método: GET
      - Parâmetro 1:
        - KEY: number_names
        - VALUE: 3 **(Ou qualquer outra quantidades de nome que precisar)**
      - Parâmetro 2:
        - KEY: list_names
        - VALUE: ["Joao Gabriel", "Felipe da Silva", "Maria Goncalves Neto"] **(Ou qualquer outro array de nomes que precisar)**
    - Após preencher, clicar em SEND

  - Outra forma de executar o teste é preencher o campo de endereço com a linha abaixo:

  ```
    http://localhost:3000/api/v1/authors?number_names=3&list_names=["Joao Gabriel", "Felipe da Silva", "Maria Goncalves Neto"]
  ```

  > *Observações*
  >
  > O valor do parâmetro 1 (number_names) deve ser um número inteiro
  >
  > O valor do parâmetro 2 (list_names) deve ser um array de strings
