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
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var littleTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainLightGray
        label.font = UIFont.regularFont(of: 14.0)
        label.text = "Fundos de Investimento"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.regularFont(of: 28.0)
        label.text = "Vinci Valorem FIMultimercado"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var separatorImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "separator")
        return imageView
    }()
    
    lazy var descriptionTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainLightGray
        label.font = UIFont.regularFont(of: 16.0)
        label.text = "O que é?"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var descriptionTextLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainLightGray
        label.font = UIFont.regularFont(of: 16.0)
        label.text = "O Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos."
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var riskTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainLightGray
        label.font = UIFont.regularFont(of: 16.0)
        label.text = "Grau de risco do investimento"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var riskView: RiskView = {
        let riskView = RiskView(numberOfItems: 5, selectedItem: 4, colorOfItems: [UIColor.riskGreen, UIColor.riskDarkGreen, UIColor.riskYellow, UIColor.riskOrange, UIColor.riskRed])
        return riskView
    }()
    
    lazy var infoTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainLightGray
        label.font = UIFont.regularFont(of: 16.0)
        label.text = "Mais informações sobre o investimento"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor.white
        tableView.estimatedRowHeight = 56.0
        tableView.rowHeight = UITableViewAutomaticDimension
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

extension MainView {
    func setupItems() {
        self.backgroundColor = UIColor.white
        
        addSubview(scrollView)
        scrollView.addSubview(containerView)
        containerView.addSubview(littleTitleLabel)
        containerView.addSubview(titleLabel)
        containerView.addSubview(separatorImageView)
        containerView.addSubview(descriptionTitleLabel)
        containerView.addSubview(descriptionTextLabel)
        containerView.addSubview(riskTitleLabel)
        containerView.addSubview(riskView)
        containerView.addSubview(infoTitleLabel)
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
        
        littleTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(containerView.snp.top).offset(16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(littleTitleLabel.snp.bottom).offset(8)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        separatorImageView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        descriptionTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(separatorImageView.snp.bottom).offset(8)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        descriptionTextLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionTitleLabel.snp.bottom).offset(4)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        riskTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(descriptionTextLabel.snp.bottom).offset(32)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        riskView.snp.makeConstraints { (make) in
            make.top.equalTo(riskTitleLabel).offset(40)
            make.left.equalTo(8)
            make.right.equalTo(-8)
        }
        
        infoTitleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(riskView.snp.bottom).offset(64)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
    }
}

