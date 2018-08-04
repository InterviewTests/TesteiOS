//
//  FundInfoModel.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundInfoModel {
    var name: String! { get }
    var data: String! { get }
}

struct FundInfoModelFields: FundInfoModel {
    let name: String!
    let data: String!
}
