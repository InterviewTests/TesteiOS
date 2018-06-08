//
//  TestUtils.swift
//  InvestAppTests
//
//  Created by Victor tavares on 07/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation
import XCTest

class XCTestCaseBase: XCTestCase {

    func loadJsonMockData(formFile name: String, type: String) throws -> Data? {

        let bundle = Bundle(for: Swift.type(of: self))

        if let path = bundle.path(forResource: name, ofType: type) {
            let json = try String(contentsOfFile: path, encoding: String.Encoding.utf8)
            return json.data(using: .utf8)
        }

        return nil
    }

    

}
