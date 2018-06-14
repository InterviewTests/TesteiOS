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
    static let validateError = "Preencha corretamente todos os campos"
}

struct ViewControllersIdentifier {
    static let formIdentifier = "FormViewController"
    static let fundsIdentifier = "FundsViewController"
    static let successIdentifier = "SuccessViewController"
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

struct Colors {
    static let valid = #colorLiteral(red: 0.6666666667, green: 0.862745098, blue: 0.5529411765, alpha: 1)
    static let invalid = #colorLiteral(red: 1, green: 0.5137254902, blue: 0.5137254902, alpha: 1)
    static let checked = #colorLiteral(red: 0.8549019608, green: 0.003921568627, blue: 0.003921568627, alpha: 1)
    static let unchecked = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
}

struct Segues {
    static let successSegue = "successViewSegue"
}

struct Patterns {
    static let mailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,30}"
    static let phoneRegex = "\\([0-9]{2}\\) [0-9]{4,5}-[0-9]{4}"
    static let eightDigitsPhonePatern = "(##) ####-####"
    static let nineDigitsPhonePatern = "(##) #####-####"
}
