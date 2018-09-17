//
//  Namespaces.swift
//  Investimentos
//
//  Created by Cmdev on 11/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

enum CellNamespace {
    //MARK: - Form
    static let PresentationCell = "PRESENTATION_CELL"
    static let TextFieldCell = "TEXT_FIELD_CELL"
    static let RegisterEmailCell = "REGISTER_EMAIL_CELL"
    static let SendButtonCell = "SEND_BUTTON_CELL"
    
    //MARK: - Funds
    static let FundInfoCell = "FUND_INFO_CELL"
    static let DegreeRiskCell = "DEGREE_RISK_CELL"
    static let InfoTitleCell = "INFO_TITLE_CELL"
    static let InvestButtonCell = "INVEST_BUTTON_CELL"
    static let MoreInfoCell = "MORE_INFO_CELL"
    static let InfoCell = "INFO_CELL"
    static let DownInfoCell = "DOWN_INFO_CELL"
    static let MoreInfoHeader = "MORE_INFO_HEADER"
    static let SeparatorCell = "SEPARATOR_CELL"
}

enum StoryboardIdentifiersNamespaces {
    static let FormViewController = "FormViewController"
    static let FundsViewController = "FundsViewController"
}

enum SeguesIdentifiersNamespaces {
    static let SuccessMessageSegue  = "SUCCESS_MESSAGE_SEGUE"
}
