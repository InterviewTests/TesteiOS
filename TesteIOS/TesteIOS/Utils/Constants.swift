//
//  Constants.swift
//  TesteIOS
//
//  Created by Sidney Silva on 11/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

struct Url {
    static let formUrl = "https://floating-mountain-50292.herokuapp.com/cells.json"
}

struct ErrorMessenger {
    static let connectError = "Erro ao conectar com o servidor"
    static let fetchError = "Erro ao decodificar os dados recebidos"
}

struct ViewControllersIdentifier {
    static let formIdentifier = "FormViewController"
    static let fundsIdentifier = "FundsViewController"
}

struct CellIdentifier {
    static let fundsCell = "fundsCell"
    static let formCell = "formCell"
}
