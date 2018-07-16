//
//  te.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 24/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

enum TypeCell: Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField: String {
    case text
    case telNumber
    case email
}

/*
 
 "type": tipo da célula;
 
 "message": mensagem que vai aparecer na label para type = text ou placeholder para field;
 
 typeField": tipo do field a ser exibido, para exibir corretamente a validação daquele campo.
 
 hidden": indica se o campo está visível;
 
 topSpacing": espaçamento entre o topo da célula e o topo da label/field/ checkbox;
 
 show": indica o campo que será exibido quando este campo for selecionado. No caso é o id do campo a ser exibido.
 
 type": "send" esse botão irá validar todas informações que foram preenchidas e ir para a tela de sucesso quando tudo tiver ok;
 
 risk": pode ser um int de 1 a 5
 
 O tipo text a validação é digitou alguma coisa, já ficou válido.
 Para "telNumber" o campo deve ser formatado (##) ####-#### || (##) #####-#### e validado de acordo.
 Para "email" o email deve ser válido.
 */
