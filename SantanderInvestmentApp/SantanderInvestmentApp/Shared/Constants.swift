//
//  Constants.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

struct Constants {
    struct Request {
        static let domain = "https://floating-mountain-50292.herokuapp.com/"
        static let cells = Constants.Request.domain + "cells.json"
        static let fund = Constants.Request.domain + "fund.json"
    }
    
}
