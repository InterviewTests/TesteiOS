//
//  Screen.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 08/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit
import EVReflection

class Screen: EVObject {
    var title: String?
    var fundName: String?
    var whatIs: String?
    var definition: String?
    var riskTitle: String?
    var risk: NSNumber?
    var infoTitle: String?
    var moreInfo: MoreInfo?
    var info = [Info]()
    var downInfo = [Info]()
}
