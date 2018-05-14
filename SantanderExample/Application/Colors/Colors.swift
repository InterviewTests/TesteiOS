//
//  Colors.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 11/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

class Colors {
  
  static let shared = Colors()
  
  func getVeryLowRiskColor() -> UIColor {
    return UIColor(hex: "0x74DA61")
  }
  
  func getLowRiskColor() -> UIColor {
    return UIColor(hex: "0x4AC16C")
  }
  
  func getMediumRiskColor() -> UIColor {
    return UIColor(hex: "0xFFC011")
  }
  
  func getAlertRiskColor() -> UIColor {
    return UIColor(hex: "0xFF742C")
  }
  
  func getCriticalRiskColor() -> UIColor {
    return UIColor(hex: "0xFF3634")
  }
  

}
