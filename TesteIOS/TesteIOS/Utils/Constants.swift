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
    static let textFieldCell = "textFieldCell"
    static let buttonCell = "buttonCell"
    static let labelCell = "labelCell"
    static let checkButtonCell = "checkButtonCell"
    static let imageCell = "imageCell"
}

struct NibName {
    static let textfieldNib = "TextField"
    static let labelNib = "Label"
    static let buttonNib = "Button"
    static let checkButtonNib = "CheckButton"
}

struct AlertControllerConstant {
    static let alertTitle = "Atenção"
    static let confirmButton = "tentar novamente"
}
