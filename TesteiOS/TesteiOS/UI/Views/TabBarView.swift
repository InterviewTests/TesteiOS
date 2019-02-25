//
//  TabBarView.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 21/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class TabBarView: UIView {
  
  lazy var button1: TabBarButton = {
    let button = TabBarButton(frame: .zero)
    button.tag = 0
    button.setTitle("Investimento", for: .normal)
    return button
  }()
  
  lazy var button2: TabBarButton = {
    let button = TabBarButton(frame: .zero)
    button.tag = 1
    button.setTitle("Contato", for: .normal)
    return button
  }()
  
  lazy var containerView: UIStackView = {
    let view = UIStackView(frame: .zero)
    view.axis = .horizontal
    view.distribution = .fillEqually
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewCode()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension TabBarView: ViewCode {
  func buildViewHierarchy() {
    addSubview(containerView)
  }
  
  func setupConstraints() {
    containerView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
    }
  }
  
  func configureViews() {
    containerView.addArrangedSubview(button1)
    containerView.addArrangedSubview(button2)
  }
}
