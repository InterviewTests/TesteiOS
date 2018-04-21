//
//  TextCell.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 20/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class ButtonCell: UITableViewCell {
    var topSpacing: CGFloat = 0
    
    lazy var button: Button = {
        let button = Button()
        return button
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

extension ButtonCell: ViewConfigurationProtocol {
    func setup(title: String, topSpacing: CGFloat) {
        button.setTitle(title, for: .normal)
        self.topSpacing = topSpacing
        
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
        addSubview(button)
    }
    
    func setupLayout() {
        button.snp.makeConstraints { (make) in
            make.left.right.equalTo(0)
            make.top.equalTo(self.snp.top).offset(topSpacing)
            make.height.equalTo(50)
        }
    }
}
