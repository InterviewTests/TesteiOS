//
//  TextCell.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class TextCell: UITableViewCell {
    lazy var cardView: CardView = {
        let card = CardView()
        return card
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.textCellLightGray
        label.font = UIFont.regularFont(of: 16.0)
        label.numberOfLines = 0
        return label
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

extension TextCell: ViewConfigurationProtocol {
    func setup(title: String) {
        titleLabel.text = title
        
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
        addSubview(cardView)
        cardView.addSubview(titleLabel)
    }
    
    func setupLayout() {
        cardView.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.height.equalTo(46).priority(250)
            make.bottom.equalTo(0)
            make.top.equalTo(0)
        }
        
        titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(cardView.snp.left)
            make.right.equalTo(cardView.snp.right)
            make.top.equalTo(cardView.snp.top)
            make.bottom.equalTo(cardView.snp.bottom).offset(-4)
        })
    }
}
