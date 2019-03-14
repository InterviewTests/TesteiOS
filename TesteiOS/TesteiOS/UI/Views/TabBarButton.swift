//
//  TabBarButton.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 21/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class TabBarButton: UIButton {

  override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    contentMode = .scaleAspectFit
    clipsToBounds = true
    adjustsImageWhenHighlighted = false
    adjustsImageWhenDisabled = false
    setBackgroundImage(UIImage(named: "tabBarItemNormal"), for: .normal)
    setBackgroundImage(UIImage(named: "tabBarItemSelected"), for: .selected)
    tintColor = ColorPalette.white
    titleLabel?.font = UIFont(name: FontNames.medium, size: 16)
  }
}
