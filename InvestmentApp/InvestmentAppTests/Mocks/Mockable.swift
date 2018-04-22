//
//  Mockable.swift
//  InvestmentAppTests
//
//  Created by Matheus Weber on 21/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class Mockable {
    func mock<T: Codable>(type: T.Type, jsonFile: String) -> T {
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            do {
                let url = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: url)
                
                let decoder = JSONDecoder()
                let result = try decoder.decode(type.self, from: data)
                return result
            } catch {
                print(error)
            }
        }
        fatalError("Mock file not found")
    }
}
