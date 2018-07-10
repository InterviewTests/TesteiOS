//
//  SendMessageModels.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

enum SendMessage
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")!
    }
    enum Response {
        case success([FormItem])
        case error(Error)
    }
    struct ViewModel
    {
    }
  }
    
    struct FormItem {
        var id: Int
        var type: FormItemType
        var fieldType: FormFieldType
        var message: String?
        var hidden: Bool = false
        var topSpacing: Int
        var show: Int?
        var required: Bool = true
        
        init(dict: [String: Any]) throws {
            guard let id = dict["id"] as? Int else {
                throw ParsingError.BadJSONError
            }
            
            self.id = id
            self.type = FormItemType(rawValue: dict["type"] as? Int ?? 1)!
            self.fieldType = FormFieldType(rawValue: dict["typefield"] as? Int ?? 1)!
            self.message = dict["message"] as? String
            
            if let hidden = dict["hidden"] as? Bool {
                self.hidden = hidden
            }
        
            self.topSpacing = dict["topSpacing"] as? Int ?? 30
            self.show = dict["show"] as? Int
        }
    }

}

enum FormItemType: Int {
    case field = 1
    case text = 2
    case checkbox = 4
    case send = 5
}

enum FormFieldType: Int {
    case text = 1
    case telNumber = 2
    case email = 3
}


