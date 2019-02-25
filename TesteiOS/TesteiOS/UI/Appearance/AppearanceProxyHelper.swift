//
//  AppearanceProxyHelper.swift
//  Movs
//
//  Created by Brendoon Ryos on 24/01/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

struct AppearanceProxyHelper {
  
  private init() {}
  
  static func customizeNavigationBar(){
    let navBarAppearance = UINavigationBar.appearance()
    navBarAppearance.isTranslucent = false
    navBarAppearance.shadowImage = UIImage()
    navBarAppearance.setBackgroundImage(UIImage(), for: .default)
    navBarAppearance.barTintColor = ColorPalette.white
    navBarAppearance.tintColor = ColorPalette.rossoCorsa
    navBarAppearance.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: FontNames.medium, size: 16)!, NSAttributedString.Key.foregroundColor: ColorPalette.jet]
  }  
}
