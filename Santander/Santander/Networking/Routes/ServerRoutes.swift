//
//  ServerRoutes.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit

struct ServerRoutes {
    
    static let baseRoute = "https://floating-mountain-50292.herokuapp.com/"
    
    // Contact
    struct Contact {
        static let getForm = "cells.json"
    }
    
    // Founds
    struct Funds {
        static let getFunds = "fund.json"
    }
}
