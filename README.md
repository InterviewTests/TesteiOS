## Introdução

Desafio proposto pelo Santander para vaga de desenvolvedor iOS.


## Informações iniciais

* Linguaguem: Swift 4
* Versão do iOS suportada: 9 ou superior
* Arquitetura: [Clean Swift](https://clean-swift.com/handbook/)
* Testes unitários: XCTest

## Descrição do projeto
O projeto possui duas telas. Uma de investimentos e uma de formulario. 
* A tela de investimento lê o [JSON](https://floating-mountain-50292.herokuapp.com/funds.json) e mostra o conteudo na tela. O botão de baixar abre uma safariViewController com o link do [Google](http://www.google.com.br).
* A tela de formulario cria um formulario dinâmico a partir do [JSON](https://floating-mountain-50292.herokuapp.com/cells.json). O formulário se adapta ao conteudo recebido, sendo totalmente flexivel.

## Descrições tecnicas.
* O projeto é feito quase em sua totalidade usando recursos nativos. Apenas uma biblioteca para formatação de telefone foi utilizada. 
* O parse do JSON é feito a partir do recurso nativo [Codable](https://developer.apple.com/documentation/swift/codable)
* Os testes unitários utilizam o recurso nativo [XCTest](https://developer.apple.com/documentation/xctest)
* As telas são criadas a partir de uma Container View, com duas TableViewControllers como filhas.
* O Json de formulario possui um erro no campo de TypeField, onde em vez de retornar um inteiro, retorna uma string.
* As requisições são feitas usando [URLSession](https://developer.apple.com/documentation/foundation/urlsession).

## Como executar

Basta abrir a pasta TesteIos e executar o arquivo TesteIOS.xcworkspace.
```bash
Caso necessário, execute o comando pod install via terminal na pasta do projeto (necessario Cocoapods instalado)
```

## Bibliotecas de terceiros utilizadas: 
* [AnyFormatKit](https://github.com/luximetr/AnyFormatKit)

