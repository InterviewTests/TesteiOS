//
//  File.swift
//  SantanderIOSUITests
//
//  Created by Adauto Oliveira on 03/06/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import Foundation
import XCTest

class TestContacts: XCTestCase {
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    func testAlert() {
        
        let app = XCUIApplication()
        app.tables/*@START_MENU_TOKEN@*/.buttons["Enviar"]/*[[".cells.buttons[\"Enviar\"]",".buttons[\"Enviar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Campos não preenchidos"].buttons["Ok"].tap()
        
        XCTAssertFalse(app.alerts["Campos não preenchidos"].buttons["Ok"].exists)
    }
    
    func testBotaoEnviar() {
        
        let app = XCUIApplication()
        let tablesQuery = app.tables
        tablesQuery/*@START_MENU_TOKEN@*/.textFields["Nome Completo"]/*[[".cells.textFields[\"Nome Completo\"]",".textFields[\"Nome Completo\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let aKey = app/*@START_MENU_TOKEN@*/.keys["a"]/*[[".keyboards.keys[\"a\"]",".keys[\"a\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        aKey.tap()
        
        let dKey = app/*@START_MENU_TOKEN@*/.keys["d"]/*[[".keyboards.keys[\"d\"]",".keys[\"d\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        dKey.tap()
        aKey.tap()
        
        let uKey = app/*@START_MENU_TOKEN@*/.keys["u"]/*[[".keyboards.keys[\"u\"]",".keys[\"u\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        uKey.tap()
        
        let tKey = app/*@START_MENU_TOKEN@*/.keys["t"]/*[[".keyboards.keys[\"t\"]",".keys[\"t\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        tKey.tap()
        
        let oKey = app/*@START_MENU_TOKEN@*/.keys["o"]/*[[".keyboards.keys[\"o\"]",".keys[\"o\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        oKey.tap()
        
        
        let returnButton = app/*@START_MENU_TOKEN@*/.buttons["Return"]/*[[".keyboards",".buttons[\"retorno\"]",".buttons[\"Return\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        returnButton.tap()
        aKey.tap()
        dKey.tap()
        aKey.tap()
        uKey.tap()
        tKey.tap()
        oKey.tap()
        
        let moreKey = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"mais, números\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey.tap()
        
        let key = app/*@START_MENU_TOKEN@*/.keys["."]/*[[".keyboards.keys[\".\"]",".keys[\".\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key.tap()
        
        
        let moreKey2 = app/*@START_MENU_TOKEN@*/.keys["more"]/*[[".keyboards",".keys[\"mais, letras\"]",".keys[\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/
        moreKey2.tap()
        oKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["l"]/*[[".keyboards.keys[\"l\"]",".keys[\"l\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let iKey = app/*@START_MENU_TOKEN@*/.keys["i"]/*[[".keyboards.keys[\"i\"]",".keys[\"i\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        iKey.tap()
        
        let vKey = app/*@START_MENU_TOKEN@*/.keys["v"]/*[[".keyboards.keys[\"v\"]",".keys[\"v\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        vKey.tap()
        
        let eKey = app/*@START_MENU_TOKEN@*/.keys["e"]/*[[".keyboards.keys[\"e\"]",".keys[\"e\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        eKey.tap()
        iKey.tap()
        app/*@START_MENU_TOKEN@*/.keys["r"]/*[[".keyboards.keys[\"r\"]",".keys[\"r\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        aKey.tap()
        moreKey.tap()
        
        let key2 = app/*@START_MENU_TOKEN@*/.keys["@"]/*[[".keyboards.keys[\"@\"]",".keys[\"@\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key2.tap()
        moreKey2.tap()
        
        let mKey = app/*@START_MENU_TOKEN@*/.keys["m"]/*[[".keyboards.keys[\"m\"]",".keys[\"m\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        mKey.tap()
        eKey.tap()
        moreKey.tap()
        key.tap()
        moreKey2.tap()
        app/*@START_MENU_TOKEN@*/.keys["c"]/*[[".keyboards.keys[\"c\"]",".keys[\"c\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        oKey.tap()
        mKey.tap()
        returnButton.tap()
        moreKey.tap()
        
        let key3 = app/*@START_MENU_TOKEN@*/.keys["4"]/*[[".keyboards.keys[\"4\"]",".keys[\"4\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key3.tap()
        
        let key4 = app/*@START_MENU_TOKEN@*/.keys["1"]/*[[".keyboards.keys[\"1\"]",".keys[\"1\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key4.tap()
        
        let key5 = app/*@START_MENU_TOKEN@*/.keys["5"]/*[[".keyboards.keys[\"5\"]",".keys[\"5\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        key5.tap()
        key4.tap()
        key4.tap()
        key4.tap()
        app/*@START_MENU_TOKEN@*/.keys["3"]/*[[".keyboards.keys[\"3\"]",".keys[\"3\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        key5.tap()
        returnButton.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Enviar"]/*[[".cells.buttons[\"Enviar\"]",".buttons[\"Enviar\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        tablesQuery/*@START_MENU_TOKEN@*/.buttons["Enviar nova mensagem"]/*[[".cells.buttons[\"Enviar nova mensagem\"]",".buttons[\"Enviar nova mensagem\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        
        XCTAssert(app.buttons["Enviar"].exists)
        
    }
    
    
    
    
}
