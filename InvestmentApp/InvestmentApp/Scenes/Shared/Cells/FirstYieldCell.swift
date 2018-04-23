//
//  FirstYieldCell.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class FirstYieldCell: UITableViewCell {
    lazy var fundoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.textCellLightGray
        label.font = UIFont.regularFont(of: 14.0)
        label.text = "Fundo"
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    lazy var CDILabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.textCellLightGray
        label.font = UIFont.regularFont(of: 14.0)
        label.text = "CDI"
        label.numberOfLines = 0
        label.textAlignment = .right
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

extension FirstYieldCell: ViewConfigurationProtocol {
    func setup() {
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
        addSubview(fundoLabel)
        addSubview(CDILabel)
    }
    
    func setupLayout() {
        CDILabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).dividedBy(4)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(44)
        }
        
        fundoLabel.snp.makeConstraints { (make) in
            make.right.equalTo(CDILabel.snp.left)
            make.top.equalTo(self.snp.top)
            make.height.equalTo(44)
        }
    }
}

