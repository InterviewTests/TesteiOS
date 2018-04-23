//
//  ProgressView.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 19/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit
import SnapKit

open class ProgressView {
    var containerView = UIView()
    var progressView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    static let shared = ProgressView()
    
    open func showProgressView(_ view: UIView) {
        containerView.frame = view.frame
        containerView.center = view.center
        containerView.backgroundColor = UIColor.loadingGray.withAlphaComponent(0.3)
        
        progressView.backgroundColor = UIColor.loadingBlack.withAlphaComponent(0.7)
        progressView.clipsToBounds = true
        progressView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        
        progressView.addSubview(activityIndicator)
        containerView.addSubview(progressView)
        view.addSubview(containerView)
        
        activityIndicator.startAnimating()
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(view.snp.edges)
        }
        
        progressView.snp.makeConstraints { (make) in
            make.center.equalTo(containerView)
            make.width.height.equalTo(80)
        }
        
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalTo(progressView)
        }
    }
    
    open func hideProgressView() {
        activityIndicator.stopAnimating()
        containerView.removeFromSuperview()
    }
}
