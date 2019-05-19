//
//  FundsTextCell.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class FundsTextCell: UITableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.medium.of(size: 14)
        label.textColor = .gray
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.medium.of(size: 28)
        label.textColor = .lightGray
        label.numberOfLines = 0
        label.textAlignment = .center
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

extension FundsTextCell {
    
    internal struct Configuration {
        var titleText: String
        var titleFont: UIFont
        var subtitleText: String
        var subtitleFont: UIFont
    }
    
    func configure(data: Configuration) {
        self.titleLabel.text = data.titleText
        self.titleLabel.font = data.titleFont
        self.subtitleLabel.text = data.subtitleText
        self.subtitleLabel.font = data.subtitleFont
    }
    
}

extension FundsTextCell: ViewCoding {
    
    public func insertViews() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    public func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
        }
        
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.right.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        titleLabel.setContentHuggingPriority(.required, for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
        subtitleLabel.setContentHuggingPriority(.required, for: .vertical)
        subtitleLabel.setContentHuggingPriority(.required, for: .horizontal)
    }
    
}
