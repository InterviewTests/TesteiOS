//
//  FundTableViewCell.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 24/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FundTableViewCell: UITableViewCell, ConfigurableView {
    
    var fundViewModel: FundViewModel? {
        didSet {
            nameInfo.text = fundViewModel?.fund?.screen.info[fundViewModel?.row ?? 0].name
        }
    }
    
    let nameInfo = UILabel(textColor: .lightGray, font: UIFont(name: "Arial", size: 16))
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([nameInfo])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameInfo.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameInfo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
            ])
    }
}
