//
//  TesteiOSUITests.swift
//  TesteiOSUITests
//
//  Created by Marcel Mendes Filho on 09/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import XCTest

@testable import TesteiOS

class TesteiOSUITests: XCTestCase {
    
    var thisApp: XCUIApplication!
        
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        
        thisApp = XCUIApplication()
        thisApp.launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    // valida se os componentes essenciais do form de contato estão lá
    func testFormUI()
    {
        let contatoButton = thisApp.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).staticTexts["Contato"]
        
        contatoButton.tap()
        
        let tablesQuery = thisApp.tables
        let nomeCompleto = tablesQuery.cells.containing(.staticText, identifier:"Nome completo").children(matching: .textField).element
        let email = tablesQuery.cells.containing(.staticText, identifier:"Email").children(matching: .textField).element
        let telefone = tablesQuery.cells.containing(.staticText, identifier:"Telefone").children(matching: .textField).element
        let cadastrarEmail = tablesQuery/*@START_MENU_TOKEN@*/.images["Retangulo Off"]/*[[".cells.images[\"Retangulo Off\"]",".images[\"Retangulo Off\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let botaoEnviar = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Enviar"]/*[[".cells.staticTexts[\"Enviar\"]",".staticTexts[\"Enviar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        
        XCTAssertTrue(contatoButton.exists)
        XCTAssertTrue(nomeCompleto.exists)
        XCTAssertTrue(email.exists)
        XCTAssertTrue(telefone.exists)
        XCTAssertTrue(cadastrarEmail.exists)
        XCTAssertTrue(botaoEnviar.exists)
    }
    
    func testFundUI()
    {
        let tablesQuery = thisApp.tables
        
        let fund = thisApp.staticTexts["Investimento"]
        XCTAssertTrue(fund.exists)
        fund.tap()
        
        let fundTitle = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Vinci Valorem FI Multimercado"]/*[[".cells.staticTexts[\"Vinci Valorem FI Multimercado\"]",".staticTexts[\"Vinci Valorem FI Multimercado\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let whatIs = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["O que é?"]/*[[".cells.staticTexts[\"O que é?\"]",".staticTexts[\"O que é?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let moreFundInfo = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Mais informações sobre o investimento"]/*[[".cells.staticTexts[\"Mais informações sobre o investimento\"]",".staticTexts[\"Mais informações sobre o investimento\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let monthFundPerformance = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["No mês"]/*[[".cells.staticTexts[\"No mês\"]",".staticTexts[\"No mês\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(fundTitle.exists)
        XCTAssertTrue(whatIs.exists)
        XCTAssertTrue(moreFundInfo.exists)
        XCTAssertTrue(monthFundPerformance.exists)

        monthFundPerformance.swipeUp()
        
        let complementares = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Complementares"]/*[[".cells.staticTexts[\"Complementares\"]",".staticTexts[\"Complementares\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(complementares.exists)
        complementares.swipeUp()
        
        let aplicacaoInicial = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Aplicação inicial"]/*[[".cells.staticTexts[\"Aplicação inicial\"]",".staticTexts[\"Aplicação inicial\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(aplicacaoInicial.exists)
        aplicacaoInicial.swipeDown()
        
        let fundPerformanceIndex = tablesQuery/*@START_MENU_TOKEN@*/.cells.containing(.staticText, identifier:"0.30 %")/*[[".cells.containing(.staticText, identifier:\"No mês\")",".cells.containing(.staticText, identifier:\"0.30 %\")"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.children(matching: .staticText).matching(identifier: "0.30 %").element(boundBy: 1)
        let fundInfo = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["D+0"]/*[[".cells.staticTexts[\"D+0\"]",".staticTexts[\"D+0\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(fundPerformanceIndex.exists)
        XCTAssertTrue(fundInfo.exists)

        let shareButton = thisApp.buttons["Button"]
        XCTAssertTrue(shareButton.exists)
        shareButton.tap()
        
        let doneButton = thisApp/*@START_MENU_TOKEN@*/.otherElements["URL"]/*[[".buttons[\"Address\"]",".otherElements[\"Address\"]",".otherElements[\"URL\"]",".buttons[\"URL\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        XCTAssertTrue(doneButton.exists)
        doneButton.tap()
    }
}
