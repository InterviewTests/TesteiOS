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
    
    static func fetchData(to scene: Scene) {
        guard let url = URL(string: scene.rawValue) else { return }
        URLSession.shared.dataTask(with: url) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let gitData = try decoder.decode(Investment.self, from: data)
                print(gitData.screen)
                
            } catch let err {
                print("Error: ", err)
            }
            }.resume()
    }
}
