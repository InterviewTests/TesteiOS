//
//  DynamicCell.swift
//  santander
//
//  Created by Jonatha Lima on 20/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class DynamicCell: UITableViewCell {
    
    public var containerView: UIView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DynamicCell: ViewCoding {
    
    public func insertViews() {
        guard let containerView = containerView else {
            return
        }
        
        addSubview(containerView)
    }
    
    public func setupConstraints() {
        guard let containerView = self.containerView else {
            return
        }
        
        containerView.snp.remakeConstraints { remake in
            remake.top.bottom.equalToSuperview()
            remake.left.equalToSuperview().offset(40)
            remake.right.equalToSuperview().inset(40)
        }
    }
    
}

extension DynamicCell {
    
    internal struct Configuration {
        var containerView: UIView?
    }
    
    func configure(data: Configuration) {
        self.containerView = data.containerView
        buildViewCode()
    }
    
}
