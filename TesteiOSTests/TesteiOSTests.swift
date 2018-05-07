//
//  TesteSantanderTests.swift
//  TesteSantanderTests
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import XCTest
@testable import TesteiOS

class TesteiOSTests: XCTestCase {

    // setup de variáveis locais para testes
    let generalFunctions = GeneralFunctions()
    let thisFormAPI = FormAPI()
    let URL_Form_Valida = "https://floating-mountain-50292.herokuapp.com/cells.json"
    let URL_Form_Invalida = "https://mustfail.herokuapp.com/cells.json"
    
    let thisFundAPI = FundAPI()
    let URL_Fund_Valida = "https://floating-mountain-50292.herokuapp.com/fund.json"
    let URL_Fund_Invalida = "https://mustfail.herokuapp.com/fund.json"
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEmailAddressValidation()
    {
        XCTAssertFalse(generalFunctions.isValidEmail(emailAddress: "endereco") , "Endereço de email deveria ser inválido")
        XCTAssertFalse(generalFunctions.isValidEmail(emailAddress: "endereco!") , "Endereço de email deveria ser inválido")
        XCTAssertFalse(generalFunctions.isValidEmail(emailAddress: "@.com") , "Endereço de email deveria ser inválido")
        XCTAssertTrue(generalFunctions.isValidEmail(emailAddress: "endereco@com"), "Endereço de email deveria ser válido")
    }
    
    func testFormAPI_Valido()
    {
        let myExpectation_URL_Form_Valida = expectation(description: "Recupera JSON de FORM usando URL valida")
        
        // teste de retrieve com URL valida
        thisFormAPI.fetchFormData(URL: URL_Form_Valida) { (resultado, erro, formModel) in
            XCTAssertTrue(resultado, "O fetchFormData deveria ter retornado com sucesso")
            XCTAssertTrue( erro == "", "O fetchFormData não deveria ter retornado mensagem de erro")
            XCTAssertTrue( formModel != nil, "O fetchFormData deveria ter retornado um objeto do tipo FormModel")
            
            myExpectation_URL_Form_Valida.fulfill()
        }
        
        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
    }
    
    func testFormAPI_Invalido()
    {
        let myExpectation_URL_Form_Invalida = expectation(description: "Recupera JSON de FORM usando URL invalida")

        // teste de retrieve com URL invalida
        thisFormAPI.fetchFormData(URL: URL_Form_Invalida) { (resultado, erro, formModel) in
            XCTAssertTrue( !resultado, "O fetchFormData deveria ter retornado com erro")
            XCTAssertTrue( erro != "", "O fetchFormData deveria ter retornado mensagem de erro")
            XCTAssertTrue( formModel == nil, "O fetchFormData não deveria ter retornado um objeto do tipo FormModel")
            
            myExpectation_URL_Form_Invalida.fulfill()
        }
        
        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
    }
    
    func testFundAPI_Valida()
    {
        let myExpectation_URL_Fund_Valida = expectation(description: "Recupera JSON de FORM usando URL valida")

        // teste de retrieve com URL valida
        thisFundAPI.fetchFundData(URL: URL_Fund_Valida) { (resultado, erro, fundModel) in
            XCTAssertTrue( resultado, "O fetchFundData deveria ter retornado com sucesso")
            XCTAssertTrue( erro == "", "O fetchFundData não deveria ter retornado mensagem de erro")
            XCTAssertTrue( fundModel != nil, "O fetchFundData deveria ter retornado um objeto do tipo FundModel")
            
            myExpectation_URL_Fund_Valida.fulfill()
        }
        
        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
    }
    
    func testFundAPI_Invalida()
    {
        let myExpectation_URL_Fund_Invalida = expectation(description: "Recupera JSON de FORM usando URL invalida")
        
        // teste de retrieve com URL invalida
        thisFundAPI.fetchFundData(URL: URL_Fund_Invalida) { (resultado, erro, fundModel) in
            XCTAssertTrue( !resultado, "O fetchFundData deveria ter retornado com erro")
            XCTAssertTrue( erro != "", "O fetchFundData deveria ter retornado mensagem de erro")
            XCTAssertTrue( fundModel == nil, "O fetchFundData não deveria ter retornado um objeto do tipo FundModel")
            
            myExpectation_URL_Fund_Invalida.fulfill()
        }
        
        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
    }
    
}
