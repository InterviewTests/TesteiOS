//
//  MoreInfo.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 08/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import EVReflection

class MoreInfo: EVObject {
    var month: Fund?
    var year: Fund?
    var _12months: Fund?
    
    override func propertyMapping() -> [(keyInObject: String?, keyInResource: String?)] {
        return [(keyInObject: "_12months", keyInResource: "12months")]
    }
}
