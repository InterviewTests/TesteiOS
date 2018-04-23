//
//  MainView.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView, ViewConfigurationProtocol {
    lazy var investementView: InvestmentView = {
        let investementView = InvestmentView()
        return investementView
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

extension MainView {
    func setup(littleTitle: String, title: String, descriptionTitle: String, descriptionText: String, risk: String, riskSelected: Int, info: String) {
        
        investementView.setup(littleTitle: littleTitle, title: title, descriptionTitle: descriptionTitle, descriptionText: descriptionText, risk: risk, riskSelected: riskSelected, info: info)
    
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        
        addSubview(investementView)
    }
    
    func setupLayout() {
        investementView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    func updateTable() {
        investementView.tableView.snp.makeConstraints { (make) in
            make.height.equalTo(investementView.tableView.contentSize.height)
        }
    }
}
