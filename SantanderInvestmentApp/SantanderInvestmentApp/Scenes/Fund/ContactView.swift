//
//  ContactView.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import SnapKit

class ContactView: UIView, ViewConfigurationProtocol {
    var status: ViewStatus<ButtonAction?>? {
        didSet {
            if let status = self.status {
                setupStatus(status: status)
            }
        }
    }
    
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
    
    lazy var successView: UIView = {
        let view = UIView()
        view.isHidden = true
        return view
    }()
    
    lazy var littleTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.mainLightGray
        label.font = UIFont.regularFont(of: 14.0)
        label.text = "Obrigado!"
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.text = "Mensagem enviada com sucesso :)"
        label.font = UIFont.regularFont(of: 28.0)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var sendAgainButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didClickOnButton), for: .touchUpInside)
        button.setTitle("Enviar nova mensagem", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = UIFont.regularFont(of: 14.0)
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .center
        
        return button
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
        containerView.addSubview(successView)
        
        successView.addSubview(littleTitleLabel)
        successView.addSubview(titleLabel)
        successView.addSubview(sendAgainButton)
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
        
        successView.snp.makeConstraints { (make) in
            make.top.right.left.bottom.equalTo(0)
        }
        
        littleTitleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(containerView.snp.centerY).offset(-20)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(containerView.snp.centerY).offset(30)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        sendAgainButton.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
    }
}

extension ContactView {
    func setupStatus(status: ViewStatus<ButtonAction?>) {
        switch status {
        case .ready:
            tableView.isHidden = false
            successView.isHidden = true
        case .success:
            tableView.isHidden = true
            successView.isHidden = false
        default:
            break
        }
    }
    
    @objc
    func didClickOnButton() {
        self.status = .ready
        self.tableView.reloadData()
    }
}
