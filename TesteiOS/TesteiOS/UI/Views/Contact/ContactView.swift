//
//  ContactView.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 21/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import UIKit

class ContactView: UIView {
  lazy var activityIndicator: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(style: .whiteLarge)
    view.color = ColorPalette.black
    return view
  }()
  
  lazy var tableView: ContactTableView = {
    let view = ContactTableView()
    view.separatorStyle = .none
    view.alwaysBounceVertical = false
    return view
  }()
  
  private lazy var feedbackView: FeedbackView = {
    let view = FeedbackView.loadFromNib()
    view.alpha = 0
    return view
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViewCode()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func showFeedbackView() {
    UIView.animate(withDuration: 0.2) {
      self.feedbackView.alpha = 1
    }
  }
}

extension ContactView: ViewCode {
  func buildViewHierarchy() {
    addSubview(tableView)
    addSubview(feedbackView)
    addSubview(activityIndicator)
  }
  
  func setupConstraints() {
    tableView.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.leading.equalToSuperview()
      make.trailing.equalToSuperview()
      make.bottom.equalTo(-55)
    }
    
    feedbackView.snp.makeConstraints { make in
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
