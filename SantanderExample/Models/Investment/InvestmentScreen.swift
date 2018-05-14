//
//  InvestmentScreen.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 10/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

struct InvestmentScreen: Codable {
  
  var title: String?
  var fundName: String?
  var whatIs: String?
  var definition: String?
  var riskTitle: String?
  var risk: Int?
  var infoTitle: String?
  var moreInfo: InvestmentMoreInformation?
  var info: [InvestmentInformation]?
  var downInfo: [InvestmentInformation]?

}
