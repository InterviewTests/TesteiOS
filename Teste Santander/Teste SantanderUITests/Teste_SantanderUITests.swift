//
//  Teste_SantanderUITests.swift
//  Teste SantanderUITests
//
//  Created by Luann Marques Luna on 03/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import XCTest

@testable import Teste_Santander
import Alamofire
import SwiftyJSON

class Teste_SantanderUITests: XCTestCase {
    var screen: InvestimentScreen!
    
    var statusCode: Int!
    var error: Error!
    
    override func setUp() {
        Alamofire.request(URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")!).validate().responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                let json = JSON(value)
                self.screen = InvestimentScreen(json["screen"])
                self.statusCode = response.response!.statusCode
                self.error = response.error
            }
        }
        
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        screen = nil
        statusCode = nil
        error = nil
    }

    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let manager = InvestmentManager()
        measure {
            manager.getData {
                guard let screen = manager.screenInfo else {return}
                self.screen = screen
                
                XCTAssertNotNil(self.screen)
                XCTAssertNotNil(self.error)
                XCTAssertEqual(self.statusCode, 200)
                
                XCTAssertEqual(self.screen.risk, 4)
                XCTAssertEqual(self.screen.downInfo.count, 5)
                XCTAssertEqual(self.screen.info.count, 7)
                
                XCTAssertEqual(self.screen.info[0].value, "0,50%")
                
                
                
            }
        }
    }

}
