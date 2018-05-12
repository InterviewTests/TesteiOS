//
//  ContatoModel.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class FormModel: NSObject {
    
    // espelho dos campos JSON
    var id: Int?
    var type: Int?
    var message: String?
    var typeField: Int?
    var hidden: Bool?
    var topSpacing: Int?
    var show: Int?
    var required: Bool?

    // estrutura de dados para armazenar o data entry nos campos
    struct DataEntry
    {
        var stringData: String?
        var intData: Int?
        var booleanData = false
        var fieldTag: Int?
        var tapGestureRecognizer: UITapGestureRecognizer?
    }
    
    // variável que armazenará o data entry nos campos
    var dataEntry = DataEntry()
    
    // array que armazenará cada um dos campos do arquivo JSON
    var ElementosForm = [FormModel]()
    
}
