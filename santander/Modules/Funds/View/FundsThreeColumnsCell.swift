//
//  FundsThreeColumnsCell.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class FundsThreeColumnsCell: UITableViewCell {
    
    private lazy var firstLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 14)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var secondLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 14)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var thirdLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 14)
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension FundsThreeColumnsCell {
    
    internal struct Configuration {
        var firstColumn: (String, UIColor)?
        var secondColumn: (String, UIColor)?
        var thirdColumn: (String, UIColor)?
    }
    
    func configure(data: Configuration) {
        self.firstLabel.text = data.firstColumn?.0
        self.firstLabel.textColor = data.firstColumn?.1
        self.secondLabel.text = data.secondColumn?.0
        self.secondLabel.textColor = data.secondColumn?.1
        self.thirdLabel.text = data.thirdColumn?.0
        self.thirdLabel.textColor = data.thirdColumn?.1
    }
    
}

extension FundsThreeColumnsCell: ViewCoding {
    
    public func insertViews() {
        addSubview(firstLabel)
        addSubview(secondLabel)
        addSubview(thirdLabel)
    }
    
    public func setupConstraints() {
        
        firstLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.bottom.equalToSuperview()
        }
        
        secondLabel.snp.makeConstraints { make in
            make.left.equalTo(firstLabel.snp.right)
            make.top.bottom.equalToSuperview()
            make.width.lessThanOrEqualTo(50)
        }
        
        thirdLabel.snp.makeConstraints { make in
            make.left.equalTo(secondLabel.snp.right).offset(10)
            make.right.equalToSuperview().inset(28)
            make.top.bottom.equalToSuperview()
            make.width.equalTo(90)
        }
        
    }
    
}

