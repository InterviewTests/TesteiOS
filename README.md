Drivers de arquitetura do app:
- reusabilidade da solução de formulário - o model, a API e a view suportam qualquer tipo de formulário
- reusabilidade das views, que pode ser embutidas repetidamente em várias e diferentes container views
- independência do MODEL e INTERFACES (APIs) da camada de controle (Clean Architecture guidelines)
- independência e reusabilidade de funções genéricas (validação de email e extensões para UIColor, String e ViewController)
- gestão da assincronicidade da obtenção dos arquivos JSON

Para rodar o app:
- faça um clone do repositório para sua máquina ou um merge com o branch master
- configure o signing do target TesteSantander
- escolha o dispositivo ou simulador e execute

Notas de itens que surgiram durante o desenvolvimento do app:
- a estrutura do JSON de formulário de contato tem um bug no id 3: o typefield deveria ser numérico mas vem string. O model Form tem um "workaround" para lidar com esse bug.
- a estrutura do JSON de fundos poderia mais otimizada. Por exemplo: no grupo de performance do fundo, ao invés de nomear month, year e 12months, poderia usar id numérico e criar uma entrada "label" no mesmo nível de "fund" e "CDI". Poderíamos usar a entrada "label" diretamente na UI do app - dispensaríamos a "tradução" que fui obrigado a fazer.

Frameworks utilizados:
- JMMaskTextfield-Swift: máscara de UITextField para entrada de número de telefone.
- SVProgressHUD: overlay informativo de dados carregando.
