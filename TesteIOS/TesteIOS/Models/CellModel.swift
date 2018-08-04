//
//  CellModel.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol CellModel {
    var id: Int! { get }
    var type: Int! { get }
    var message: String! { get }
    var typeField: Int? { get }
    var hidden: Bool! { get }
    var topSpacing: Double! { get }
    var show: Int? { get }
    var isRequired: Bool! { get }
}

struct CellModelFields: CellModel {
    let id: Int!
    let type: Int!
    let message: String!
    let typeField: Int?
    let hidden: Bool!
    let topSpacing: Double!
    let show: Int?
    let isRequired: Bool!
}
