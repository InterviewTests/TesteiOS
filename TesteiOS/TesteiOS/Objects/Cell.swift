//
//  Cell.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 7/3/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit


enum Type : Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}

enum TypeField : Int {
    case text = 1
    case telNumber = 2
    case email = 3
}



class Cell {
    
    var id = 0
    var type = Type(rawValue: 0) // cell type
    var message = "" // message to show in label for type = text ou placeholder for type = field
    var typefield = TypeField(rawValue: 0) // field type for validation purposes
    var hidden : Bool = false // whether the field is visible
    var topSpacing = 60.0 // spacing between top cell and top label/field/checkbox
    var show = 0 // field to be shown when it is selected (field if to be shown)
    var required : Bool = false
}



//type": "send" esse botão irá validar todas informações que foram preenchidas e ir para a tela de sucesso quando tudo tiver ok;
//
//risk": pode ser um int de 1 a 5
//
//O tipo text a validação é digitou alguma coisa, já ficou válido.
//Para "telNumber" o campo deve ser formatado (##) ####-#### || (##) #####-#### e validado de acordo.
//Para "email" o email deve ser válido.



