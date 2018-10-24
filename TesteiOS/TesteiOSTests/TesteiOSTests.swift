//
//  TesteiOSTests.swift
//  TesteiOSTests
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import XCTest
@testable import TesteiOS

class TesteiOSTests: XCTestCase {


    // setup de variáveis locais para testes
    let generalFunctions = GlobalFunctions()
    let thisFormAPI = FormAPI()
    let URL_Form_Valida = "https://floating-mountain-50292.herokuapp.com/cells.json"
    let URL_Form_Invalida = "https://mustfail.herokuapp.com/cells.json"
    
    let thisFundAPI = FundAPI()
    let URL_Fund_Valida = "https://floating-mountain-50292.herokuapp.com/fund.json"
    let URL_Fund_Invalida = "https://mustfail.herokuapp.com/fund.json"
    
    var resultado: Bool?
    var erro: String?
    var formModel: FormModel?
    var fundModel: FundModel?
    
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
        thisFormAPI.fetchFormData(URL: URL_Form_Valida, completionHandler: { (retorno) in
            self.resultado = (retorno != nil)
            self.formModel = retorno
            myExpectation_URL_Form_Valida.fulfill()
        }) { (errorMessage) in
            myExpectation_URL_Form_Valida.fulfill()
            self.erro = errorMessage
        }

        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
        
        XCTAssertTrue(resultado!, "O fetchFormData deveria ter retornado com sucesso")
        XCTAssertNil( erro, "O fetchFormData não deveria ter retornado mensagem de erro")
        XCTAssertNotNil(formModel, "O fetchFormData deveria ter retornado um objeto do tipo FormModel")
        
    }
    
    func testFormAPI_Invalido()
    {
        let myExpectation_URL_Form_Invalida = expectation(description: "Recupera JSON de FORM usando URL invalida")
        
        // teste de retrieve com URL invalida
        thisFormAPI.fetchFormData(URL: URL_Form_Invalida, completionHandler: { (retorno) in
            self.resultado = (retorno == nil)
            self.formModel = retorno
            myExpectation_URL_Form_Invalida.fulfill()
        }) { (errorMessage) in
            self.resultado = (errorMessage == nil)
            self.erro = errorMessage
            myExpectation_URL_Form_Invalida.fulfill()
        }

        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
        
        XCTAssertFalse( resultado!, "O fetchFormData deveria ter retornado com erro")
        XCTAssertNotNil( erro, "O fetchFormData deveria ter retornado mensagem de erro")
        XCTAssertNil( formModel, "O fetchFormData não deveria ter retornado um objeto do tipo FormModel")
    }
    
    func testFundAPI_Valida()
    {
        let myExpectation_URL_Fund_Valida = expectation(description: "Recupera JSON de FORM usando URL valida")
        
        // teste de retrieve com URL valida
        thisFundAPI.fetchFundData(URL: URL_Fund_Valida, completionHandler: { (retorno) in
            self.resultado = (retorno != nil)
            self.fundModel = retorno
            myExpectation_URL_Fund_Valida.fulfill()
        }) { (errorMessage) in
            self.resultado = (errorMessage == nil)
            self.erro = errorMessage
            myExpectation_URL_Fund_Valida.fulfill()
        }

        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
        
        XCTAssertTrue( resultado!, "O fetchFundData deveria ter retornado com sucesso")
        XCTAssertNil( erro, "O fetchFundData não deveria ter retornado mensagem de erro")
        XCTAssertNotNil( fundModel, "O fetchFundData deveria ter retornado um objeto do tipo FundModel")
    }
    
    func testFundAPI_Invalida()
    {
        let myExpectation_URL_Fund_Invalida = expectation(description: "Recupera JSON de FORM usando URL invalida")
        
        // teste de retrieve com URL invalida
        thisFundAPI.fetchFundData(URL: URL_Fund_Invalida, completionHandler: { (retorno) in
            self.resultado = (retorno == nil)
            self.fundModel = retorno
            myExpectation_URL_Fund_Invalida.fulfill()
        }) { (errorMessage) in
            self.resultado = (errorMessage == nil)
            self.erro = errorMessage
            myExpectation_URL_Fund_Invalida.fulfill()
        }
        
        waitForExpectations(timeout: 60) { (error) in
            if let gotError = error
            {
                print( gotError.localizedDescription)
            }
        }
        
        XCTAssertFalse( resultado!, "O fetchFundData deveria ter retornado com erro")
        XCTAssertNotNil( erro, "O fetchFundData deveria ter retornado mensagem de erro")
        XCTAssertNil( fundModel, "O fetchFundData não deveria ter retornado um objeto do tipo FundModel")
        
    }

}
