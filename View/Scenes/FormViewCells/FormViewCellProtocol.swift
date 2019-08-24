//
//  FormViewCellProtocol.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 24/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Domain

protocol FundViewCell {
    func configure(id: Int, message: String, fieldType: FieldType, userInput: Any?, enabled: Bool, hidden: Bool, topSpacing: Double)
}
