//
//  API.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit
import SwiftyJSON

typealias ServiceResponse = (JSON, Error?) -> Void

class ApiManager: NSObject {
    static let sharedInstance = ApiManager()
    
    static let host = "https://floating-mountain-50292.herokuapp.com/"
    struct url {
        static let cells = host + "cells.json"
        static let investimentos = host + "fund.json"
    }
    
    private func makeHTTPGetRequest(path: String, onCompletion: @escaping ServiceResponse){
        let request = NSMutableURLRequest(url: URL.init(string: path)!)
        let session = URLSession.shared
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {data, response, err -> Void in
            do{
                let json:JSON = try JSON(data: data!)
                onCompletion(json, err)
            }catch{
                onCompletion(JSON.null, err)
            }
        })
        task.resume()
    }
    
    func fetchCells(completionHandler: @escaping ([Cell]) -> Void){
        var cells = [Cell]()
        makeHTTPGetRequest(path: url.cells, onCompletion: { json, err in
            for (_,data) in json["cells"]{
                let hidden = data["hidden"].boolValue
                let id = data["id"].intValue
                let topSpacing = data["topSpacing"].floatValue
                let required = data["required"].boolValue
                let message = data["message"].stringValue
                let type = data["type"].intValue
                let show = data["show"].int
                
                //api error handling
                var typeField : Int
                let tf = data["typefield"]
                if let typeF = tf.int{
                    typeField = typeF
                }else{
                    typeField = TypeField.fromString(tf.stringValue).rawValue
                }
                
                let cell = FormModels.FetchCell.ViewModel.DisplayedCell(id: id, type: type, message: message, typefield: typeField, hidden: hidden, topSpacing: topSpacing, show: show, required: required)
                
                cells.append(Cell.init(viewModel: cell))
            }
            completionHandler(cells)
        })
    }
    
    
    func fetchFunds(completionHandler: @escaping ([Fund]) -> Void){
        makeHTTPGetRequest(path: url.investimentos, onCompletion: { json, err in
            var arr = [Fund]()
            for (_, data) in json{
                arr.append(Fund(json: data))
            }
            completionHandler(arr)
        })
    }
}

