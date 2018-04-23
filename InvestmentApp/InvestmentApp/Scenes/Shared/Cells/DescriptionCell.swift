//
//  DescriptionCell.swift
//  InvestmentApp
//
//  Created by Matheus Weber on 22/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import UIKit

class DescriptionCell: UITableViewCell {
    var buttonAction: ButtonAction = {}

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.textCellLightGray
        label.font = UIFont.regularFont(of: 14.0)
        label.text = ""
        label.numberOfLines = 0
        return label
    }()
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.regularFont(of: 14.0)
        label.text = ""
        label.numberOfLines = 0
        label.textAlignment = .right
        return label
    }()
    
    lazy var downloadButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(didClickOnButton), for: .touchUpInside)
        button.setTitle("Baixar", for: .normal)
        button.setTitleColor(UIColor.red, for: .normal)
        button.titleLabel?.font = UIFont.regularFont(of: 14.0)
        button.backgroundColor = .clear
        button.contentHorizontalAlignment = .right

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

extension DescriptionCell: ViewConfigurationProtocol {
    func setup(title: String, value: String, withDownloadButton: Bool = false, buttonAction: @escaping ButtonAction = {}) {
        titleLabel.text = title
        valueLabel.text = value
        downloadButton.isHidden = !withDownloadButton
        valueLabel.isHidden = withDownloadButton
        
        self.buttonAction = buttonAction
        setupView()
    }
    
    func setupItems() {
        self.backgroundColor = UIColor.white
        self.selectionStyle = .none
        
        addSubview(titleLabel)
        addSubview(valueLabel)
        addSubview(downloadButton)
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).dividedBy(2)
            make.left.equalTo(self.snp.left)
            make.height.equalTo(44)
        }
        
        valueLabel.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).dividedBy(4)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(44)
        }
        
        downloadButton.snp.makeConstraints { (make) in
            make.width.equalTo(self.snp.width).dividedBy(4)
            make.right.equalTo(self.snp.right)
            make.height.equalTo(44)
        }
    }
}

extension DescriptionCell {
    @objc
    func didClickOnButton() {
        self.buttonAction()
    }
}


