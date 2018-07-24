//
//  CellMetaData.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

enum FieldState{
    case Default
    
    case Invalid
    case Required
    
    case Success
    case Failure
}

struct CellMetaData:Equatable{
    
    var cell:Cell?
    var textValue:String = ""
    var selected:Bool = false
    
    var isHidden:Bool = false
    
    var fieldState:FieldState = .Default
}
