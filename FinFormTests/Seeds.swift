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
        static let firstCell = Cell.init(id: 1, type: Type.field, message: "Message", typeField: TypeField.text, hidden:false, topSpacing: 30.0, show: 1, required: true)
        static let secondCell = Cell.init(id: 2, type: Type.field, message: "Email", typeField: TypeField.email, hidden:false, topSpacing: 30.0, show: 1, required: true)
        static let thirdCell = Cell.init(id: 3, type: Type.field, message: "Numero de telefone", typeField: TypeField.telNumber, hidden:false, topSpacing: 30.0, show: 1, required: false)
    }
    
    struct CellsMetaData
    {
        static let first = CellMetaData(cell: Seeds.Cells.firstCell, textValue: "", selected: false, fieldState: FieldState.Default)
        static let second = CellMetaData(cell: Seeds.Cells.secondCell, textValue: "nome@host.com", selected: false, fieldState: FieldState.Default)
        static let third = CellMetaData(cell: Seeds.Cells.thirdCell, textValue: "(11) 11111-1111", selected: false, fieldState: FieldState.Default)
        
        static let wrongEmail = CellMetaData(cell: Seeds.Cells.secondCell, textValue: "nome@host", selected: false, fieldState: FieldState.Default)
        static let wrongTelNumber = CellMetaData(cell: Seeds.Cells.thirdCell, textValue: "(11) 11111-1", selected: false, fieldState: FieldState.Default)
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
    
    struct TelNumber{
        static let telNumberMask:String = "(**) *****-****"
        static let telNumberWithMask:String = "(11) 11111-1111"
        static let telNumberWithoutMask:String = "11111111111"
    }

}
