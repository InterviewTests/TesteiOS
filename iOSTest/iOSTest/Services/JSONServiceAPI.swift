//
//  JsonCellsAPI.swift
//  iOSTest
//
//  Created by erick.peripolli on 29/07/18.
//  Copyright © 2018 Erick Peripolli. All rights reserved.
//

import Foundation

class JSONServiceAPI {
    enum Scene: String {
        case investment = "https://floating-mountain-50292.herokuapp.com/fund.json"
        case contact = "https://floating-mountain-50292.herokuapp.com/cells.json"
    }
    
    static func fetchInvestmentInfo(completionHandler: @escaping (Investment) -> ()) {
        guard let url = URL(string: Scene.investment.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(Investment.self, from: data)
                
                completionHandler(jsonData)
            } catch let err {
                print("Error: ", err)
            }
            }.resume()
    }
    
    static func fetchContactCells(completionHandler: @escaping (ContactCells) -> ()) {
        guard let url = URL(string: Scene.contact.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ContactCells.self, from: data)
                print(jsonData)
                
                completionHandler(jsonData)
            } catch let err {
                print("Error: ", err)
            }
            }.resume()
    }
    
//    static func fetchData(to scene: Scene) -> Codable? {
//        guard let url = URL(string: scene.rawValue) else { return nil }
//        URLSession.shared.dataTask(with: url) { (data, response
//            , error) in
//            guard let data = data else { return }
//            do {
//                let decoder = JSONDecoder()
//                let jsonData = try decoder.decode(Investment.self, from: data)
//                print(jsonData.screen)
//
//                return jsonData
//
//            } catch let err {
//                print("Error: ", err)
//            }
//            }.resume()
//    }
}
