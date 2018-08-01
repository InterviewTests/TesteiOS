//
//  Internet.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import Foundation

class Internet {
    
    static func isConnected() -> Bool {
        var result = true
        
        let status = Reach().connectionStatus()
        
        switch status {
        case .unknown, .offline: result = false
        case .online(.wwan), .online(.wiFi):
            break
        }
        
        return result
    }
}
