//
//  FundInfo.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 23/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation

protocol Fundable {
    var name : String? { get set }
    var data : String? { get set }
}

struct FundInfo : Codable, Fundable {
    var name: String?
    var data: String?
}
