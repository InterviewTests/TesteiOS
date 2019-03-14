//
//  FundsView.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 23/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class FundsView: UIView {
  lazy var activityIndicator: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .whiteLarge)
    view.color = ColorPalette.black
    return view
  }()
  
  lazy var tableView: FundsTableView = {
    let view = FundsTableView()
    view.separatorStyle = .none
    view.alwaysBounceVertical = false
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

extension FundsView: ViewCode {
  func buildViewHierarchy() {
    addSubview(tableView)
    addSubview(activityIndicator)
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(-55)
    }
    
    activityIndicator.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(-55)
    }
  }
}
