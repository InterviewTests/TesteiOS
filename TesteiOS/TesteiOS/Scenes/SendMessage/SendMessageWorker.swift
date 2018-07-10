//
//  SendMessageWorker.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

typealias Response = SendMessage.Something.Response

class SendMessageWorker {
    func requestForm(url: URL, completion: @escaping (Response)->()) {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(Response.error(error))
            }
            
            do {
                guard
                    let resp = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: Any],
                    let cellsArray = resp["cells"] as? [[String: Any]]
                    else {
                        completion(Response.error(ParsingError.BadJSONError))
                        return
                    }
                
                completion(try Response.success(self.getItemsFrom(array: cellsArray)))
            } catch let error {
                completion(Response.error(error))
            }
        }
        
        task.resume()
    }
    
    func getItemsFrom(array: [[String: Any]]) throws -> [SendMessage.FormItem] {
        return try array.map { dict in
            return try SendMessage.FormItem(dict: dict)
        }
    }
    
}
