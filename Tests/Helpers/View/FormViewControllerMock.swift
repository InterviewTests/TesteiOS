//
//  FormViewControllerMock.swift
//  Tests
//
//  Created by Erika de Almeida Segatto on 20/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Domain
@testable import TesteiOS

class FormViewControllerMock: BasicViewMock, FormView {
    
    private(set) var cells = [FormViewCellMock]()
    var isInFormSentPage = false
    
    func refresh() { }
    
    func goToFormSentSuccesfullyPage() {
        isInFormSentPage = true
    }
    
}


class FormViewCellMock: FormViewCell {
    
    private(set) var id: Int? = nil
    private(set) var message: String? = nil
    private(set) var fieldType: FieldType? = nil
    private(set) var userInput: Any? = nil
    private(set) var enabled: Bool? = nil
    private(set) var hidden: Bool? = nil
    private(set) var topSpacing: Double? = nil
    private(set) weak var delegate: FormViewCellDelegate? = nil
    
    
    func configure(id: Int, message: String, fieldType: FieldType, userInput: Any?, enabled: Bool, hidden: Bool, topSpacing: Double, delegate: FormViewCellDelegate?) {
        self.id = id
        self.message = message
        self.fieldType = fieldType
        self.userInput = userInput
        self.enabled = enabled
        self.hidden = hidden
        self.topSpacing = topSpacing
        self.delegate = delegate
    }
    
    
}
