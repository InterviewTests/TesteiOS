//
//  InputTextCell.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class InputTextCell: UITableViewCell {
    var topSpacing: CGFloat = 0

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.inputTitleLightGray
        label.font = UIFont.regularFont(of: 11.0)
        label.text = "Title Label"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var textField: TextField = {
        let textField = TextField()
        textField.addCleanButton()
        return textField
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

extension InputTextCell: ViewConfigurationProtocol {
    func setup(topSpacing: CGFloat) {
        self.topSpacing = topSpacing
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
        addSubview(titleLabel)
        addSubview(textField)
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints({ (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(self.snp.top).offset(topSpacing)
        })
        
        textField.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.height.equalTo(43)
            make.bottom.equalTo(0)
        }
        textField.changeBorderColor(to: UIColor.red.cgColor)
    }
}
