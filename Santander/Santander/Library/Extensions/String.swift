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

extension String {
    
    var isPhone: Bool {
        let regex = "^[0-9+]{0,1}+[0-9]{5,16}$"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
    
    var isEmail: Bool {
        let regex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let test = NSPredicate(format: "SELF MATCHES %@", regex)
        return test.evaluate(with: self)
    }
}
