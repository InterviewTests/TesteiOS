//
//  ContactView.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 26/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit
import SnapKit

class ContactView: UIView, ViewConfigurationProtocol {
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.isScrollEnabled = false
        return tableView
    }()
    
    init() {
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}

extension ContactView {
    func setup() {
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(tableView)
    }
    
    func setupLayout() {
        scrollView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView.snp.width)
            make.height.equalTo(scrollView.snp.height).priority(250)
        }
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(80)
            make.left.equalTo(16)
            make.right.equalTo(-16)
            make.bottom.equalTo(containerView.snp.bottom).offset(-20)
        }
    }
}
