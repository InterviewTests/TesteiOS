//
//  ButtonCell.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import UIKit

class ButtonCell: UITableViewCell {
    var buttonAction: ButtonAction = {}
    var topSpacing: CGFloat = 0
    
    lazy var button: Button = {
        let button = Button()
        button.addTarget(self, action: #selector(didClickOnButton), for: .touchUpInside)
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
    func setup(title: String, topSpacing: CGFloat, buttonAction: @escaping ButtonAction) {
        button.setTitle(title, for: .normal)
        
        self.topSpacing = topSpacing
        self.buttonAction = buttonAction
        
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

extension ButtonCell {
    @objc
    func didClickOnButton() {
        self.buttonAction()
    }
}
