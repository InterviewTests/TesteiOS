//
//  REST.swift
//  testeSantanderIOS
//
//  Created by Adauto Oliveira on 18/05/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import Foundation

struct Cell: Codable{

    var id: Int?
    var type: Int?
    var message: String?
    var typefield: Int?
    var hidden: Bool?
    var topSpacing: Double?
    var show: Int?
    var required: Bool?
}

struct Form: Codable {
    var cells: [Cell]
    
    enum CodingKeys: String, CodingKey {
        case cells = "cells"
    }
    
    init(from decoder: Decoder) throws {
    
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let cells = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .cells)
        self.cells = try cells.decode([Cell].self, forKey: .cells)
        
    }
    
    init(cells : [Cell]){
        self.cells = cells
    }
}

class REST {
    
    
    private static let basePath = "https://floating-mountain-50292.herokuapp.com/cells.json"
    
    private static let configuration: URLSessionConfiguration = {
        let config = URLSessionConfiguration.default
        config.allowsCellularAccess = true
        config.httpAdditionalHeaders = ["Content-Type": "application/json"]
        config.timeoutIntervalForRequest = 30.0
        config.httpMaximumConnectionsPerHost = 5
        return config
    }()
    private static let session = URLSession(configuration: configuration)
    
    typealias RestLoadCompletion = (Form?) -> Void
    
    
    class func loadCell(completion : @escaping (Form?) -> Void) {
        guard let url = URL(string: basePath) else {return}
        
        let dataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in

            if error == nil {
                
                guard let response = response as? HTTPURLResponse else {
                    
//                    DispatchQueue.main.async {
//                        completion(nil)
//                    }
                    return
                    
                }
                if response.statusCode == 200 {
                    
                    guard let data = data else {return}
                    
                    do{

                         let formulario = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)

                            if let form = formulario as? [String:AnyObject], let cells = form ["cells"] as? [AnyObject]{
                            
                            var myCells : [Cell] = []
                            
                            for cell in cells {
                            
                                if let cellDictionary = cell as? [String:AnyObject]{
                                    
                                    
                                    let cell = Cell(id: cellDictionary["id"]as? Int, type: cellDictionary["type"]as? Int, message: cellDictionary["message"]as? String, typefield: cellDictionary["typefield"]as? Int, hidden: cellDictionary["hidden"]as? Bool, topSpacing: cellDictionary["topSpacing"]as? Double, show: cellDictionary["show"]as? Int, required: cellDictionary["required"]as? Bool)
                                    myCells.append(cell)
                                    

    
                                }else{
                                    
                                    DispatchQueue.main.async {
                                    completion(nil)
                                    }
                                    return
                                    
                                }
                            
                            }

                            let form = Form(cells: myCells)
                            DispatchQueue.main.async {
                                completion(form)
                            }
                            
                            
                        }else{
                            
                            print("Não converteu")
                        }


                    }catch{
                        print(error.localizedDescription)
                    }
                    
                }else {
                    print("Algum Status Invalido pelo servidor")
                }
                
                
            } else {
                print(error!)
            }
        }
        dataTask.resume()
        
    }
    
}
