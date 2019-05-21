//
//  FundsResourceCell.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import Foundation

import UIKit

public class FundsResourceCell: UITableViewCell {
    
    public var tapAction: (() -> Void)?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 14)
        label.textColor = Resource.Color.lightGray
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var resourceStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 4
        stackView.axis = .horizontal
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var resourceLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 14)
        label.textColor = Resource.Color.red
        label.textAlignment = .right
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var resourceImage: UIImageView = {
        let label = UIImageView()
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

extension FundsResourceCell {
    
    internal struct Configuration {
        var title: String
        var resource: (String, UIImage)
    }
    
    func configure(data: Configuration) {
        self.titleLabel.text = data.title
        self.resourceLabel.text = data.resource.0
        self.resourceImage.image = data.resource.1
    }
    
}

extension FundsResourceCell: ViewCoding {
    
    public func insertViews() {
        addSubview(titleLabel)
        addSubview(resourceStackView)
        resourceStackView.addArrangedSubview(resourceImage)
        resourceStackView.addArrangedSubview(resourceLabel)
    }
    
    public func setupConstraints() {
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(28)
            make.top.bottom.equalToSuperview()
        }
        
        resourceStackView.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(28)
            make.left.equalTo(titleLabel.snp.right)
            make.top.bottom.equalToSuperview()
        }
        
        resourceImage.snp.makeConstraints { make in
            make.height.width.equalTo(13)
        }
        
    }
    
    public func setupViews() {
        let tapGesture = UITapGestureRecognizer(target: self,
                                             action: #selector(didTapAction))
        resourceStackView.isUserInteractionEnabled = true
        resourceStackView.addGestureRecognizer(tapGesture)
    }
    
}

extension FundsResourceCell {
    
    @objc
    private func didTapAction() {
        tapAction?()
    }
    
}
