//
//  Form.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 29/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class Form:Decodable {
    let id:Int
    let type:Int
    let message:String
    let typefield: UncertainValue <Int,String>?
    let hidden:Bool
    let topSpacing:Double
    let show:Int?
    let required:Bool
    
    init(id:Int, type:Int, message:String, typefield:UncertainValue<Int,String>?, hidden:Bool, topSpacing:Double, show:Int?, required:Bool) {
        self.id = id
        self.type = type
        self.message = message
        self.typefield = typefield
        self.hidden = hidden
        self.topSpacing = topSpacing
        self.show = show
        self.required = required
    }
}
