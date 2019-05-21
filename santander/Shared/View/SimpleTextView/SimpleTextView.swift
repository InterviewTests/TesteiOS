//
//  SimpleTextView.swift
//  santander
//
//  Created by Jonatha Lima on 20/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SimpleTextView: UIView {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.medium.of(size: 16)
        label.textColor = Resource.Color.gray
        label.numberOfLines = 0
        return label
    }()
    
    init(configuration: Configuration) {
        super.init(frame: .zero)
        configure(data: configuration)
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SimpleTextView: ViewCoding {
    
    public func insertViews() {
        addSubview(titleLabel)
    }
    
    public func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension SimpleTextView {
    
    internal struct Configuration {
        var title: String?
    }
    
    func configure(data: Configuration) {
        titleLabel.text = data.title
    }
    
}

