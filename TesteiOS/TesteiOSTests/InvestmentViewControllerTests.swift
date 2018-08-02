//
//  InvestmentViewControllerTests.swift
//  TesteiOSTests
//
//  Created by Tiago Leme on 02/08/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import XCTest

class InvestmentViewControllerTests: XCTestCase {
    
    var investmentVC: InvestmentViewController!
    
    override func setUp() {
        super.setUp()
        let bundle = Bundle(for: self.classForCoder)
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        let vc: InvestmentViewController = storyboard.instantiateViewController(withIdentifier: "InvestmentViewController") as! InvestmentViewController
        investmentVC = vc
        _ = investmentVC.view // To call viewDidLoad
    }
    
    func testVIPCycle() {
        
        //Make sure all fields are populated
        XCTAssertFalse(self.investmentVC.fundName.text!.isEmpty)
        
        //TODO - Implement rest of VC fields
    }
}
