//
//  ThermometerViewCell.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class ThermometerViewCell: UITableViewCell {
    
    private lazy var containerStackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = 1
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.clipsToBounds = true
        return stack
    }()
    
    private lazy var indicatorLevelView: UIImageView = {
        let view = UIImageView(image: Resource.Image.selector.image)
        return view
    }()
    
    private lazy var goodLevelView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var goodEnoughLevelView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()
    
    private lazy var balancedLevelView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    private lazy var riskedLevelView: UIView = {
        let view = UIView()
        view.backgroundColor = .orange
        return view
    }()
    
    private lazy var riskedEnoughLevelView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    public override var frame: CGRect {
        didSet {
            goodEnoughLevelView.layer.cornerRadius =
                goodEnoughLevelView.frame.height / 2
            
            goodEnoughLevelView.layer.masksToBounds = true
            
            riskedEnoughLevelView.layer.cornerRadius =
                riskedEnoughLevelView.frame.height / 2
            
            riskedEnoughLevelView.layer.masksToBounds = true
            
            if #available(iOS 11.0, *) {
                goodEnoughLevelView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
                riskedEnoughLevelView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
            }
        }
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ThermometerViewCell: ViewCoding {
    
    public func insertViews() {
        addSubview(indicatorLevelView)
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(goodEnoughLevelView)
        containerStackView.addArrangedSubview(goodLevelView)
        containerStackView.addArrangedSubview(balancedLevelView)
        containerStackView.addArrangedSubview(riskedLevelView)
        containerStackView.addArrangedSubview(riskedEnoughLevelView)
    }
    
    public func setupConstraints() {
        
        indicatorLevelView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.width.equalTo(13)
            make.height.equalTo(8)
            make.centerX.equalTo(riskedLevelView.snp.centerX)
        }
        
        containerStackView.snp.makeConstraints { make in
            make.top.equalTo(indicatorLevelView.snp.bottom).offset(6.5)
            make.height.greaterThanOrEqualTo(10)
            make.bottom.greaterThanOrEqualToSuperview()
            make.left.equalToSuperview().offset(38)
            make.right.equalToSuperview().inset(38)
        }
        
        goodEnoughLevelView.snp.makeConstraints { make in
            make.height.equalTo(7)
            make.centerY.equalToSuperview()
        }
        
        goodLevelView.snp.makeConstraints { make in
            make.height.equalTo(7)
            make.centerY.equalToSuperview()
        }
        
        balancedLevelView.snp.makeConstraints { make in
            make.height.equalTo(7)
            make.centerY.equalToSuperview()
        }
        
        riskedLevelView.snp.makeConstraints { make in
            make.height.equalTo(10)
            make.centerY.equalToSuperview()
        }
        
        riskedEnoughLevelView.snp.makeConstraints { make in
            make.height.equalTo(7)
            make.centerY.equalToSuperview()
        }
        
    }
    
}
