# Show me the code

Esse repositório contem todo o material necessário para realizar o teste: 
- A especificação do layot está na pasta 'bank_app_layout' abrindo o index.html, os icones estão na pasta 'assets'

- A especificação dos serviços (login e statements) está no arquivo BankApp.postman_collection.json ( é necessário instalar o postman e importar a colection https://www.getpostman.com/apps)


![Image of Yaktocat](https://github.com/SantanderTecnologia/TesteiOS/blob/new_test/telas.png)

### # DESAFIO:

Na primeira tela sera uma tela de login, o campo de 'user' deverá aceitar email ou cpf, o campo password deve validar se a senha tem pelo menos uma letra maiuscula, um caracter especial e um caracter alphanumerico, tambem deve ser validada.
O ultimo usuario logado deve ser salvo de forma segura localmente, apos validado com sucesso devera realizar login no endpoint https://bank-app-test.herokuapp.com/api/login,
os dados de retorno devem ser exibidos na próxima tela.

Na segunda tela será exibido os dados formatados do retorno do login e será necessário fazer um segundo request para obter os lançamentos do usuário, no endpoint https://bank-app-test.herokuapp.com/api/statements que retorna uma lista, para ser populada como é visto no layout, ao clicar no icone de sair retorna para a tela de login 

### # Avaliação

Você será avaliado pela usabilidade, por respeitar o design e pela arquitetura do app. É esperado que você consiga explicar as decisões que tomou durante o desenvolvimento através de commits.

Obrigatórios:

* Swift 3.0 ou superior
* Autolayout
* O app deve funcionar no iOS 9
* Testes unitários, pode usar a ferramenta que você tem mais experiência, só nos explique o que ele tem de bom.
* Arquitetura a ser utilizada: Swift Clean ([https://clean-swift.com/handbook/](https://clean-swift.com/handbook/) && [https://github.com/Clean-Swift/CleanStore](https://github.com/Clean-Swift/CleanStore)
* Uso do git.

### # Observações gerais

Adicione um arquivo [README.md](http://README.md) com os procedimentos para executar o projeto.
Pedimos que trabalhe sozinho e não divulgue o resultado na internet.

Faça um fork desse desse repositório em seu Github e nos envie um Pull Request com o resultado.

# BOA SORTE!
