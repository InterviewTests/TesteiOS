//
//  String.swift
//  Santander
//
//  Created by Orlando Amorim on 11/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation
import Eureka

extension String: SectionHeaderFooterRenderable {
    public func viewForItem() -> HeaderFooterViewRepresentable {
        return HeaderFooterView(stringLiteral: self)
    }
}
