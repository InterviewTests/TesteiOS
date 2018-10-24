//
//  TesteiOSUITests.swift
//  TesteiOSUITests
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import XCTest

class TesteiOSUITests: XCTestCase {

    var thisApp: XCUIApplication!
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = true
        
        thisApp = XCUIApplication()
        thisApp.launch()
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testContactFormCompletion()
    {
        let contatoButton = thisApp.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element(boundBy: 1).staticTexts["Contato"]
        
        if contatoButton.waitForExistence(timeout: 15)
        {
            let app = XCUIApplication()
            
            contatoButton.tap()
            
            let tablesQuery = app.tables
            let deleteKey = app/*@START_MENU_TOKEN@*/.keys["delete"]/*[[".keyboards.keys[\"delete\"]",".keys[\"delete\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            let nomeCompleto = tablesQuery.cells.containing(.staticText, identifier:"Nome completo").children(matching: .textField).element
            let email = tablesQuery.cells.containing(.staticText, identifier:"Email").children(matching: .textField).element
            let telefone = tablesQuery.cells.containing(.staticText, identifier:"Telefone").children(matching: .textField).element
            //let cadastrarEmail = tablesQuery/*@START_MENU_TOKEN@*/.images["Retangulo Off"]/*[[".cells.images[\"Retangulo Off\"]",".images[\"Retangulo Off\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            var botaoEnviar = app.tables/*@START_MENU_TOKEN@*/.staticTexts["Enviar"]/*[[".cells.staticTexts[\"Enviar\"]",".staticTexts[\"Enviar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            
            // testa mensagem de erro avisando que faltou preencher nome
            botaoEnviar.tap()
            var mensagemAviso = XCUIApplication().alerts["Aviso"].buttons["OK"]
            XCTAssertTrue(mensagemAviso.exists)
            mensagemAviso.tap()

            // preenche nome
            // testa mensagem de erro avisando que faltou preencher email
            nomeCompleto.tap()
            nomeCompleto.typeText("Teste")
            botaoEnviar.tap()
            mensagemAviso = XCUIApplication().alerts["Aviso"].buttons["OK"]
            XCTAssertTrue(mensagemAviso.exists)
            mensagemAviso.tap()
            
            // preenche email
            // testa mensagem de erro avisando que faltou preencher telefone
            email.tap()
            email.typeText("teste@com")
            botaoEnviar.tap()
            mensagemAviso = XCUIApplication().alerts["Aviso"].buttons["OK"]
            XCTAssertTrue(mensagemAviso.exists)
            mensagemAviso.tap()
            
            // preenche telefone incompleto
            // testa mensagem de erro avisando que faltou preencher telefone completo
            telefone.tap()
            telefone.typeText("419993304")
            botaoEnviar.tap()
            mensagemAviso = XCUIApplication().alerts["Aviso"].buttons["OK"]
            XCTAssertTrue(mensagemAviso.exists)
            mensagemAviso.tap()
            
            // preenche telefone completo
            // testa mensagem de erro avisando que faltou preencher email válido
            telefone.tap()
            telefone.typeText("00")
            
            email.tap()
            email.tap()
            
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            
            email.typeText("teste")
            botaoEnviar.tap()
            mensagemAviso = XCUIApplication().alerts["Aviso"].buttons["OK"]
            XCTAssertTrue(mensagemAviso.exists)
            mensagemAviso.tap()
            
            // preenche email válido
            // testa avanço para tela confirmando o recebimento da mensagem
            email.tap()
            email.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            deleteKey.tap()
            email.typeText("teste@com")
            botaoEnviar.tap()
            
            let cadastrarNovoContato = thisApp.buttons["Enviar nova mensagem"]
            XCTAssertTrue(cadastrarNovoContato.exists)
            
            botaoEnviar = thisApp.tables/*@START_MENU_TOKEN@*/.staticTexts["Enviar"]/*[[".cells.staticTexts[\"Enviar\"]",".staticTexts[\"Enviar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
            XCTAssertTrue(cadastrarNovoContato.exists)
        }
    }
    
    func testFundUI()
    {
        let tablesQuery = thisApp.tables
        let app = XCUIApplication()
        let fund = thisApp.staticTexts["Investimento"]
        XCTAssertTrue(fund.exists)
        fund.tap()
        
        // verifica se campos-chave de fundos foram devidamente carregados
        let fundTitle = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Vinci Valorem FI Multimercado"]/*[[".cells.staticTexts[\"Vinci Valorem FI Multimercado\"]",".staticTexts[\"Vinci Valorem FI Multimercado\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let whatIs = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["O que é?"]/*[[".cells.staticTexts[\"O que é?\"]",".staticTexts[\"O que é?\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let moreFundInfo = tablesQuery/*@START_MENU_TOKEN@*/.staticTexts["Mais informações sobre o investimento"]/*[[".cells.staticTexts[\"Mais informações sobre o investimento\"]",".staticTexts[\"Mais informações sobre o investimento\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        let monthFundPerformance = tablesQuery.staticTexts["Mês"]
        XCTAssertTrue(fundTitle.exists)
        XCTAssertTrue(whatIs.exists)
        XCTAssertTrue(moreFundInfo.exists)
        XCTAssertTrue(monthFundPerformance.exists)
        
        app.tables.staticTexts["Mês"].swipeUp()
        
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
        
        // valida se o botão compartilhar existe e está funcionando
        let shareButton = thisApp.buttons["Button"]
        XCTAssertTrue(shareButton.exists)
        shareButton.tap()
        
        // valida se o botão compartilhar abriu um SafariViewController
        let doneButton = thisApp/*@START_MENU_TOKEN@*/.otherElements["URL"]/*[[".buttons[\"Address\"]",".otherElements[\"Address\"]",".otherElements[\"URL\"]",".buttons[\"URL\"]"],[[[-1,2],[-1,1],[-1,3,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        if doneButton.waitForExistence(timeout: 30)
        {
            doneButton.tap()
        }
    }

}
