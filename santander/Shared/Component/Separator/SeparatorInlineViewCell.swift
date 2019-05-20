//
//  SeparatorInlineViewCell.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SeparatorInlineViewCell: UITableViewCell {
    
    static var height: CGFloat = 5
    
    var style: Style = .none {
        didSet {
            update(style: style)
        }
    }
    
    private lazy var separatorImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private lazy var containerWallView: UIView = {
        let view = UIView()
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SeparatorInlineViewCell: ViewCoding {
    
    public func insertViews() {
        addSubview(containerWallView)
        addSubview(separatorImage)
    }
    
    public func setupConstraints() {
        containerWallView.snp.remakeConstraints { make in
            make.top.greaterThanOrEqualToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(0)
        }
        
        separatorImage.snp.remakeConstraints { make in
            make.top.equalTo(containerWallView.snp.bottom)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
            
            switch style {
            case .none:
                make.height.equalTo(0)
            case .line:
                make.height.equalTo(1)
            case .arrow:
                make.height.equalTo(SeparatorInlineViewCell.height)
            }
            
        }
    }
    
}

extension SeparatorInlineViewCell {
    
    internal enum Style {
        case none
        case line
        case arrow
    }
    
    func update(style: Style) {
        
        switch style {
            
        case .none:
            separatorImage.image = nil
        case .line:
            separatorImage.image = Resource.Image.selectorSingle.image
        case .arrow:
            separatorImage.image = Resource.Image.separatorInline.image
        }
        
        setupConstraints()
        
    }
    
}
