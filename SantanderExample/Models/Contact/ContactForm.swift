//
//  ContactForm.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

struct ContactForm: Codable {
  
  enum FormType: Int, Codable {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
  }
  
  enum TypeField: Int, Codable {
    case text = 1
    case telNumber = 2
    case email = 3
  }
  
  var id: Int?
  var type: FormType?
  var message: String?
  var typefield: TypeField?
  var hidden: Bool?
  var topSpacing: Float?
  var show: Int?
  var required: Bool?
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try values.decode(Int.self, forKey: .id)
    type = try values.decode(FormType.self, forKey: .type)
    message = try values.decode(String.self, forKey: .message)
    hidden = try values.decode(Bool.self, forKey: .hidden)
    topSpacing = try values.decode(Float.self, forKey: .topSpacing)
    required = try values.decode(Bool.self, forKey: .required)
    
    
    // For some reason, the type text field are returning a string instead of a int.
    do {
      let field = try values.decode(Int.self, forKey: .typefield)
      typefield = TypeField(rawValue: field)
      
    } catch {
      do {
        let string = try values.decode(String.self, forKey: .typefield)
        
        if string == "telnumber" {
          typefield = TypeField.telNumber
        } else {
          typefield = TypeField.text
        }
      } catch {
        typefield = nil
      }
    }
  }
}
