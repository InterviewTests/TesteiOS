//
//  CellModel.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

enum CellType: Int {
    case Field=1, Text, Image, Checkbox, Send
}

enum CellTypeField: Int {
    case Text=1, TelNumber, Email
}

protocol CellModel {
    var id: Int! { get }
    var type: CellType! { get }
    var message: String! { get }
    var typeField: CellTypeField? { get }
    var hidden: Bool! { get }
    var topSpacing: Double! { get }
    var show: Int? { get }
    var isRequired: Bool! { get }
}

struct CellModelFields: CellModel {
    let id: Int!
    let type: CellType!
    let message: String!
    let typeField: CellTypeField?
    let hidden: Bool!
    let topSpacing: Double!
    let show: Int?
    let isRequired: Bool!
    
    init(json: JSONDict){
        id = json["id"] as? Int ?? 0
        
        let typeInt = json["type"] as? Int ?? 1
        type = CellType.init(rawValue: typeInt) ?? CellType.Field
        
        message = json["message"] as? String ?? ""
        
        var auxTypeField: CellTypeField? = nil
        if let typeFieldInt = json["typefield"] as? Int {
            auxTypeField = CellTypeField.init(rawValue: typeFieldInt)
        } else {
            if let _ = json["typefield"] as? String {
                // If it is telnumber
                auxTypeField = CellTypeField.TelNumber
            }
        }
        typeField = auxTypeField
        
        hidden = json["hidden"] as? Bool
        topSpacing = json["topSpacing"] as? Double ?? 0
        show = json["show"] as? Int
        isRequired = json["required"] as? Bool
    }
}
