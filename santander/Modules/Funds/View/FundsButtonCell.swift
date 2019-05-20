//
//  FundsButtonCell.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class FundsButtonCell: UITableViewCell {
    
    public lazy var button: SAButton = {
        let label = SAButton(titled: "")
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

extension FundsButtonCell {
    
    internal struct Configuration {
        var title: String
    }
    
    func configure(data: Configuration) {
        self.button.setTitle(data.title, for: .normal)
    }
    
}

extension FundsButtonCell: ViewCoding {
    
    public func insertViews() {
        addSubview(button)
    }
    
    public func setupConstraints() {
        
        button.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
        }
        
    }
    
}

