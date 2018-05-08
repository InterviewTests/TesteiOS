//
//  Endpoint.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import Foundation



enum Routes{
    private var baseURL:String{
        #if DEBUG
        return "https://floating-mountain-50292.herokuapp.com/"
        #else
        return "https://floating-mountain-50292.herokuapp.com/"
        #endif
    }
    
    case fund
    case cells

    
    var endpoint:String{
        switch self {

        case .cells:
            return "\(baseURL)" + "cells.json"
        case .fund:
            return "\(baseURL)" + "fund.json"
  
            
        }
    }
    
    
    
}

