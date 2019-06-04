//
//  TestsContacts.swift
//  SantanderIOSUITests
//
//  Created by Adauto Oliveira on 03/06/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import Foundation
import XCTest

class TestInvestimento: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testBotaoInvestir() {
        // Use recording to get started writing UI tests.
        
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCUIApplication().tabBars.buttons["Investimento"].tap()
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Investir"]/*[[".cells.buttons[\"Investir\"]",".buttons[\"Investir\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Invetimento"].buttons["Ok"].tap()
        
        
        XCTAssert(app.buttons["Investir"].exists)
        
        
        
    }
    
    
    func testBotaoBaixar() {
        XCUIApplication().tabBars.buttons["Investimento"].tap()
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.cells.containing(.button, identifier:"Baixar")/*[[".cells.containing(.button, identifier:\"Investir\")",".cells.containing(.staticText, identifier:\"Pagamento [valor bruto]\")",".cells.containing(.staticText, identifier:\"D+2\")",".cells.containing(.staticText, identifier:\"D+1\")",".cells.containing(.staticText, identifier:\"D+0\")",".cells.containing(.staticText, identifier:\"0,50%\")",".cells.containing(.staticText, identifier:\"R$ 5.000,00\")",".cells.containing(.staticText, identifier:\"R$ 1.000,00\")",".cells.containing(.staticText, identifier:\"R$ 10.000,00\")",".cells.containing(.staticText, identifier:\"Adesão\")",".cells.containing(.staticText, identifier:\"Essenciais\")",".cells.containing(.staticText, identifier:\"Regulamento\")",".cells.containing(.staticText, identifier:\"Desempenho\")",".cells.containing(.staticText, identifier:\"Saldo minimo\")",".cells.containing(.staticText, identifier:\"Aplicação Inicial\")",".cells.containing(.staticText, identifier:\"Complementares\")",".cells.containing(.staticText, identifier:\"Cota [valor bruto]\")",".cells.containing(.staticText, identifier:\"Resgate [valor bruto]\")",".cells.containing(.staticText, identifier:\"Movimentação minima\")",".cells.containing(.staticText, identifier:\"Taxa de Administração\")",".cells.containing(.button, identifier:\"Baixar\")"],[[[-1,20],[-1,19],[-1,18],[-1,17],[-1,16],[-1,15],[-1,14],[-1,13],[-1,12],[-1,11],[-1,10],[-1,9],[-1,8],[-1,7],[-1,6],[-1,5],[-1,4],[-1,3],[-1,2],[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .button).matching(identifier: "Baixar").element(boundBy: 4).tap()
        app.buttons["OK"].tap()
        
        XCTAssert(app.tables.buttons["Baixar"].exists)
    }
    
}

