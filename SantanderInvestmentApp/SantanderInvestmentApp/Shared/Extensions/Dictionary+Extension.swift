//
//  Dictionary+Extension.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 17/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation

extension Dictionary {
    func queryFormat() -> String {
        var cs = CharacterSet.urlQueryAllowed
        let generalDelimitersToEncode = ":#[]@"
        let subDelimitersToEncode = "!$&'()*+,;="
        cs.remove(charactersIn: "\(generalDelimitersToEncode)\(subDelimitersToEncode)")
        return self.map{
            let keyEnconding = String(describing: $0).addingPercentEncoding(withAllowedCharacters: cs) ?? ""
            let valueEnconding = String(describing: $1).addingPercentEncoding(withAllowedCharacters: cs) ?? ""
            return keyEnconding + "=" + valueEnconding
            }.joined(separator: "&")
    }
}
