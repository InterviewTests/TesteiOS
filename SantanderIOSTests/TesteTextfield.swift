//
//  TesteTextfield.swift
//  SantanderIOSTests
//
//  Created by Adauto Oliveira on 03/06/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import Foundation
import XCTest

@testable import SantanderIOS

class TesteTextfield: XCTestCase {
    
    func testValidarTextField() {
        
        
        let viewcontroller = ContactsViewController(nibName: "ContactsViewController", bundle: Bundle.main)
        
        let tfName = UITextField()
        let tfEmail = UITextField()
        let tfPhone = UITextField()
        
        
        tfName.text = "Adauto"
        tfEmail.text = "adauto.oliveira@me.com"
        tfPhone.text = "11-99227-8799"

        
        
        let textFields: [UITextField] = [tfName, tfEmail, tfPhone]
        
        XCTAssertEqual(viewcontroller.validarTextField(textFields: textFields), true)
        
    }
    
    
    
    
}
