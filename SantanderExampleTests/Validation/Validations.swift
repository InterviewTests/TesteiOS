//
//  Validations.swift
//  SantanderExampleTests
//
//  Created by Luan Henrique Damasceno Costa on 14/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

@testable import SantanderExample
import XCTest

class Validations: XCTestCase {
  
  var validityEntity: ValidationWorkerSpy!
  
  class ValidationWorkerSpy: ValidationWorker {
    
    func validate(email: String) -> Bool {
      return ValidationWorker.validate(email: email)
    }
    
    func validate(phoneNumber: String) -> Bool {
      return ValidationWorker.validate(phoneNumber: phoneNumber)
    }
  }
  
  override func setUp() {
    super.setUp()
    validityEntity = ValidationWorkerSpy()
  }
  
  override func tearDown() {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    super.tearDown()
  }
  
  func testValidatingEmail() {
    XCTAssertFalse(validityEntity.validate(email: "luan"), "This should return false from validation!")
    XCTAssertTrue(validityEntity.validate(email: "luan@gmail.com"), "This is a valid email")
  }
  
  func testValidatingNumer() {
    
    XCTAssertFalse(validityEntity.validate(phoneNumber: "34999999"), "This should return false from validation!")
    XCTAssert(validityEntity.validate(phoneNumber: "34998384985"), "This is a valid email")
  }
  
  
}
