//
//  MoreInfoRow.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

final class MoreInfoRow: Row<MoreInfoCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}
