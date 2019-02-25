//
//  TabBarViewController.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 21/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit
import SnapKit

class TabBarViewController: UITabBarController {
  
  let tabBarView = TabBarView()

  override func viewDidLoad() {
    super.viewDidLoad()
    setup()
  }

  private func setup() {
    self.tabBar.isHidden = true
    view.addSubview(tabBarView)
    setupConstraints()
    selectedIndex = tabBarView.button1.tag
    tabBarView.button1.isSelected = true
    tabBarView.button1.addTarget(self, action: #selector(tabbarItemPressed(_:)), for: .touchUpInside)
    tabBarView.button2.addTarget(self, action: #selector(tabbarItemPressed(_:)), for: .touchUpInside)
  }
  
  func setupConstraints() {
    tabBarView.snp.makeConstraints { make in
      make.bottom.equalToSuperview()
      make.height.equalTo(57)
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
    }
  }
  
  @objc func tabbarItemPressed(_ sender: UIButton) {
    selectedIndex = sender.tag
    tabBarView.button1.isSelected = tabBarView.button1.tag == sender.tag
    tabBarView.button2.isSelected = tabBarView.button2.tag == sender.tag
  }
}
