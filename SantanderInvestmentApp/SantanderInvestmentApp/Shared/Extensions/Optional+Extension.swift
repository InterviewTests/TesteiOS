//
//  Optional+Extension.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

extension Optional where Wrapped == String {
    var orEmpty: String {
        return self ?? ""
    }
}

extension Optional where Wrapped == Int {
    var orZero: Int {
        return self ?? 0
    }
}

extension Optional where Wrapped == Float {
    var orZero: Float {
        return self ?? 0.0
    }
}

extension Optional where Wrapped == Data {
    var orNoData: Data {
        return self ?? Data.init()
    }
}
