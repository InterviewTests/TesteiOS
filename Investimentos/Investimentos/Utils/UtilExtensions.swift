//
//  UtilExtensions.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 13/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

extension Double {
    func getPercentageStringValue() -> String {
        return String(format: "%.1f%%", self)
    }
}
