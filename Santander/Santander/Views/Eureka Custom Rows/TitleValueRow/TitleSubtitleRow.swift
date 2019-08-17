//
//  TitleSubtitleRow.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

final class TitleSubtitleRow: Row<TitleSubtitleCell>, RowType {
    required public init(tag: String?) {
        super.init(tag: tag)
        displayValueFor = nil
    }
}
