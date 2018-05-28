//
//  Route.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation


public struct Router: URLRouter {
    static var basePath: String {
        return "https://floating-mountain-50292.herokuapp.com/"
    }
    
    struct Form: Creatable {
        var route:String = "cells.json"
    }
    
    struct FinanceActive: Creatable {
        var route:String = "fund.json"
    }
    
}
