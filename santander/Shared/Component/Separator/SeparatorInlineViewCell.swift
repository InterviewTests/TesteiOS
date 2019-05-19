//
//  SeparatorInlineViewCell.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SeparatorInlineViewCell: UITableViewCell {
    
    static let height: CGFloat = 5
    
    private lazy var separatorImage: UIImageView = {
        let image = UIImageView(image: Resource.Image.separatorInline.image)
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
        containerWallView.snp.makeConstraints { make in
            make.top.greaterThanOrEqualToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(0)
        }
        
        separatorImage.snp.makeConstraints { make in
            make.top.equalTo(containerWallView.snp.bottom)
            make.height.equalTo(SeparatorInlineViewCell.height)
            make.bottom.equalToSuperview()
            make.left.equalToSuperview().offset(30)
            make.right.equalToSuperview().inset(30)
        }
    }
    
}
