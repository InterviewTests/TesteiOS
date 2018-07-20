//
//  Seeds.swift
//  FinFormTests
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

@testable import FinForm
import XCTest

struct Seeds
{
    struct Cells
    {
        static let firstCell = Cell.init(id: 1, type: Type.field, message: "Message", typeField: TypeField.text, topSpacing: 30.0, show: 1, required: true)
        static let secondCell = Cell.init(id: 2, type: Type.field, message: "message@host.com.br", typeField: TypeField.email, topSpacing: 30.0, show: 1, required: true)
        static let thirdCell = Cell.init(id: 3, type: Type.field, message: "(11) 99999-9999", typeField: TypeField.telNumber, topSpacing: 30.0, show: 1, required: false)
    }
    
    struct Screens {
        
        static let month = ScreenMoreInfo.init(fund: 10.0, CDI: 10.0)
        static let year = ScreenMoreInfo.init(fund: 10.0, CDI: 10.0)
        static let twelveMonths = ScreenMoreInfo.init(fund: 10.0, CDI: 10.0)
        
        static let rootScreenMoreInfo = RootScreenMoreInfo.init(month: month, year: year, twelveMonths: twelveMonths)
        
        static let info:[ScreenInfo] = [ScreenInfo.init(name: "test", data: "test"),ScreenInfo.init(name: "test", data: "test"),ScreenInfo.init(name: "test", data: "test"),ScreenInfo.init(name: "test", data: "test")]
        
        static let downInfo:[ScreenInfo] = [ScreenInfo.init(name: "test", data: "test"),ScreenInfo.init(name: "test", data: "test"),ScreenInfo.init(name: "test", data: "test"),ScreenInfo.init(name: "test", data: "test")]
        
        static let first = Screen.init(title: "Test", fundName: "test", whatIs: "test", definition: "test", riskTitle: "test", risk: 3, infoTitle: "test", moreInfo: rootScreenMoreInfo, info: info, downInfo: downInfo)
        
    }
}
