# SantanderTeste_iOS

Informações sobre o teste:

- Swift 4;
- 
- Ele foi feito usando VIPER (uma clean arquitecture, similar ao Swift Clean (na veradeda são quaaase a mesma coisa, em essência muda os nomes dos modulos)), utilizando um projeto pessoal como base para a arquitetura;
- Não deu tempo de contruir os testes unitários, essa arquitetura consome um bom tempo na base de sua implementação, porém depois de pronta não levaria tanto tempo para contruir os testes;
- O módulo de investimento foi feito utilizando um TableView para construir o formulário dinamico;
- Enquanto o módulo de contato foi contruido usando uma ScrollView e todas as views programaticamente; (Apenas para variar a forma com que foi feito, talvez seria melhor usar uma Collection, mais tempo porém um código mais modularizado);

Para compilar o projeto:

- Apenas execute pod install na raiz do projeto (tudo deverá ocorrer bem desde que seu COCOAPODS esteja na mesma versão (1.5.0), e seus pods tambem estejam na mesma versão);
- Caso contrario apenas use pod install --repo-update;