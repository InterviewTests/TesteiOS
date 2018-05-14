//
//  InvestmentMoreInformation.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 10/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

struct InvestmentMoreInformation: Codable {
  
  struct MoreInformation: Codable {
    var fund: Float?
    var cdi: Float?
    
    enum CodingKeys: String, CodingKey {
      case fund = "fund"
      case cdi = "CDI"
    }
  }
  
  var month: MoreInformation?
  var year: MoreInformation?
  var lastTwelveMonths: MoreInformation?
  
  enum CodingKeys: String, CodingKey {
    case month
    case year
    case lastTwelveMonths = "12months"
  }
  
}
