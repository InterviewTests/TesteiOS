//
//  ContactWorker.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import Alamofire

class ContactWorker {
    
    func getCellsData (callback: @escaping ([ShowContact.GetCell.ViewModel.Cell]?) -> Void) {
        
        let url = "https://floating-mountain-50292.herokuapp.com/cells.json"
        
        Alamofire.request(url).validate(statusCode: 200..<300).responseJSON { (response) in
            
            if let json = response.result.value as? Dictionary<String,AnyObject> {
                
                if let responseChild = json["cells"] as? [Dictionary<String,AnyObject>] {
                    
                    let response = self.handle(response: responseChild)
                    callback(response)
                }
            }
        }
    }
    
    private func handle(response: [Dictionary<String,AnyObject>]?) -> [ShowContact.GetCell.ViewModel.Cell]? {
        
        var cellArray: [ShowContact.GetCell.ViewModel.Cell] = []
        
        for dictionary in response! {
            
            var typefield: Int = 0
            if let temp = dictionary["typefield"] as? Int {typefield = temp}
            
            var show: Int = 0
            if let temp = dictionary["show"] as? Int {show = temp}
            
            guard let hidden = dictionary["hidden"] as? Bool
                else {return nil}
            
            guard let required = dictionary["required"] as? Bool
            else {return nil}
            
            let cell = ShowContact.GetCell.ViewModel.Cell (
                id: dictionary["id"] as! Int,
                type: dictionary["type"] as! Int,
                message: dictionary["message"] as! String,
                typefield: typefield,
                hidden: hidden ,
                topSpacing: dictionary["topSpacing"] as! Double,
                show: show,
                isRequired: required
            )
            
            cellArray.append(cell)
        }
        
        return cellArray
    }
}
