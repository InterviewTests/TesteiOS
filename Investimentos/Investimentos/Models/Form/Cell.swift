//
//  Cell.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 07/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import EVReflection

class Cell: EVObject {
    var id: NSNumber?
    var type: NSNumber?
    var message: String?
    var typefield: NSNumber?
    var hidden = false
    var topSpacing: NSNumber?
    var show: NSNumber?
    var required = false
    
    var identifier: CellIdentifier {
        return CellIdentifier(rawValue: id?.intValue ?? 0)!
    }
}
