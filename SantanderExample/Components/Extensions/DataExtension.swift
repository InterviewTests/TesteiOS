//
//  DataExtension.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 13/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

extension Data {
  init?(fromFileWithName name: String, ofType type: String) {
    if let url = Bundle.main.url(forResource: name, withExtension: type),
      let data = try? Data(contentsOf: url, options: .mappedIfSafe) {
      self = data
    }
    else {
      return nil
    }
    
  }
}
