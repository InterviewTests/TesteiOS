//
//  TextCell.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class CheckboxCell: UITableViewCell {
    var topSpacing: CGFloat = 0
    
    lazy var checkbox: CheckBox = {
        let checkbox = CheckBox()
        return checkbox
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

extension CheckboxCell: ViewConfigurationProtocol {
    func setup(title: String, topSpacing: CGFloat) {
        titleLabel.text = title
        self.topSpacing = topSpacing
        
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
        addSubview(checkbox)
        addSubview(titleLabel)
    }
    
    func setupLayout() {
        checkbox.snp.makeConstraints { (make) in
            make.width.height.equalTo(15)
            make.left.equalTo(self.snp.left)
            make.top.equalTo(self.snp.top).offset(topSpacing)
        }
        
        titleLabel.snp.makeConstraints({ (make) in
            make.left.equalTo(checkbox.snp.right).offset(8)
            make.right.equalTo(self.snp.right)
            make.centerY.equalTo(checkbox)
            make.bottom.equalTo(self.snp.bottom).offset(-4)
        })
    }
}
