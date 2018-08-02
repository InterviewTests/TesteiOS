//
//  FieldTableViewCellTests.swift
//  TesteiOSTests
//
//  Created by Tiago Leme on 02/08/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import XCTest

class FieldTableViewCellTests: XCTestCase {
    

    var fieldTableViewCell: FieldTableViewCell!
    
    var nameCell: Contact.FetchDynamicCells.ViewModel.DisplayableCell!
    var emailCell: Contact.FetchDynamicCells.ViewModel.DisplayableCell!
    var phoneCell: Contact.FetchDynamicCells.ViewModel.DisplayableCell!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        self.fieldTableViewCell = FieldTableViewCell()
        self.fieldTableViewCell.textfield = UICustomTextfield()
        self.fieldTableViewCell.heightConstraint = NSLayoutConstraint(item: self.fieldTableViewCell.textfield.self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.fieldTableViewCell.textfield.self, attribute: NSLayoutAttribute.height, multiplier: 0, constant: 0)
        self.fieldTableViewCell.topConstraint = NSLayoutConstraint(item: self.fieldTableViewCell.textfield.self, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: self.fieldTableViewCell.textfield.self, attribute: NSLayoutAttribute.height, multiplier: 0, constant: 0)
        
        self.nameCell = Contact.FetchDynamicCells.ViewModel.DisplayableCell(id: 0, type: 1, message: "Name", typeField: 1, hidden: false, topSpacing: 0, show: nil, isRequired: true)
        self.emailCell = Contact.FetchDynamicCells.ViewModel.DisplayableCell(id: 0, type: 1, message: "Email", typeField: 3, hidden: false, topSpacing: 0, show: nil, isRequired: true)
        self.phoneCell = Contact.FetchDynamicCells.ViewModel.DisplayableCell(id: 0, type: 1, message: "Phone", typeField: 2, hidden: false, topSpacing: 0, show: nil, isRequired: true)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPhoneMaskAndValidation() {
        let validPhoneNumberWith8Digits = "1133333333"
        let validPhoneNumberWith9Digits = "11333333333"
        let invalidPhoneNumber = "12344123"
        let invalidPhoneNumberWithChar = "asdd12334412"
        
        //Set up field table cell
        self.fieldTableViewCell.setCell(cell: self.phoneCell)
        
        self.fieldTableViewCell.textfield.text = validPhoneNumberWith8Digits
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertTrue(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = validPhoneNumberWith9Digits
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertTrue(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = invalidPhoneNumber
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertFalse(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = invalidPhoneNumberWithChar
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertFalse(self.fieldTableViewCell.textfield.isValid)
        
    }
    
    func testNameValidation() {
        let validName = "A"
        let invalidName = ""
        
        //Set up field table cell
        self.fieldTableViewCell.setCell(cell: self.nameCell)
        
        self.fieldTableViewCell.textfield.text = validName
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertTrue(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = invalidName
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertFalse(self.fieldTableViewCell.textfield.isValid)
        
    }
    
    func testEmailValidation() {
        let validEmail = "tfleme@hotmail.com"
        let invalidEmail1 = "tflemehotmail.com"
        let invalidEmail2 = "tfleme@hotmailcom"
        let invalidEmail3 = "tlflemehotmailcom"
        let invalidEmail4 = "tfleme@hotmail.c"
        
        //Set up field table cell
        self.fieldTableViewCell.setCell(cell: self.emailCell)
        
        self.fieldTableViewCell.textfield.text = validEmail
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertTrue(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = invalidEmail1
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertFalse(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = invalidEmail2
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertFalse(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = invalidEmail3
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertFalse(self.fieldTableViewCell.textfield.isValid)
        
        self.fieldTableViewCell.textfield.text = invalidEmail4
        self.fieldTableViewCell.textfield.textDidChange()
        XCTAssertFalse(self.fieldTableViewCell.textfield.isValid)
    }
    
}
