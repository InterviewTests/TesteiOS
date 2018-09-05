//
//  TesteiOSTests.swift
//  TesteiOSTests
//
//  Created by Andre Paganin on 04/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
//

import XCTest
import Foundation
@testable import TesteiOS

class ApiServiceTests: XCTestCaseBase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
    func testFormEntity(_ formEntity: FormData) {
        XCTAssertEqual(formEntity.cells?.count, 6)
        if let cell = formEntity.cells?[0] {
            XCTAssertEqual(cell.id, 1)
            XCTAssertEqual(cell.type, 2)
            XCTAssertEqual(cell.message, "Olá, primeiro se apresente com o seu nome:")
            XCTAssertNil(cell.typefield)
            XCTAssertEqual(cell.hidden, false)
            XCTAssertNil(cell.show)
            XCTAssertEqual(cell.required, false)
        } else {
            XCTFail("Error while load FormTestData")
        }
    }
    
    func testInvestEntity(_ investEntity: InvestRoot) {
        XCTAssertNotNil(investEntity.screen)
        XCTAssertEqual(investEntity.screen?.title, "Fundos de investimento")
        XCTAssertNotNil(investEntity.screen?.fundName)
        XCTAssertNotNil(investEntity.screen?.definition)
        XCTAssertNotNil(investEntity.screen?.moreInfo)
        XCTAssertEqual(investEntity.screen?.info?.count, 7)
        XCTAssertEqual(investEntity.screen?.downInfo?.count, 5)
    }
    
    func testJsonToClass() {

        
        do {
            if let formData = try self.loadJsonMockData(formFile: "FormTestData", type: "txt"),
                let formEntity: FormData = try APIService.parseJsonDataToClass(formData) {
                self.testFormEntity(formEntity)
            } else {
                XCTFail("Error while load FormTestData")
            }
            
            if let investData = try self.loadJsonMockData(formFile: "InvestmentTestData", type: "txt"),
                let investEntity: InvestRoot = try APIService.parseJsonDataToClass(investData) {
                self.testInvestEntity(investEntity)
            } else {
                XCTFail("Error while load InvestData")
            }
        }catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    
    func testApiFetchData() {
        APIService.fetchJsonData(with: Constants.formJsonURL) { (formData: FormData?, result) in
            XCTAssertTrue(result == .success)
            XCTAssertNotNil(formData)
            self.testFormEntity(formData!)
        }
        
        APIService.fetchJsonData(with: Constants.formJsonURL) { (investData: InvestRoot?, result) in
            XCTAssertTrue(result == .success)
            XCTAssertNotNil(investData)
            self.testInvestEntity(investData!)
        }
    }
}
