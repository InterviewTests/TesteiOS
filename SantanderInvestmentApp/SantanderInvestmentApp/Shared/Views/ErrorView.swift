//
//  ErrorView.swift
//  SantanderInvestmentApp
//
//  Created by m.a.carvalho on 18/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import SnapKit

protocol ErrorViewDelegate: class {
    func isLoadingDataAgain()
}

class ErrorView: UIView, ViewConfigurationProtocol {
    var buttonAction: ButtonAction?
    weak var delegate: ErrorViewDelegate?
    
    fileprivate lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var errorIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ic_error_outline")
        return imageView
    }()
    
    fileprivate lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    fileprivate lazy var tryAgainButton: UIButton = {
        let button = UIButton()
        button.setTitle("Tentar novamente", for: .normal)
        button.setTitleColor(UIColor.closeGray, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didTryAgainButtonClicked), for: .touchUpInside)
        return button
    }()
    
    var errorMessage: String
    
    init(errorMessage: String, buttonAction: ButtonAction? = {}) {
        self.errorMessage = errorMessage
        self.buttonAction = buttonAction
        super.init(frame: CGRect.zero)
        setupView()
    }
    
    override init(frame: CGRect) {
        self.errorMessage = ""
        self.buttonAction = nil
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("Must not be initialized with this init")
    }
}

//MARK - Delegate methods
extension ErrorView {
    func setupItems() {
        self.backgroundColor = UIColor.white
        addSubview(contentView)
        contentView.addSubview(errorIcon)
        contentView.addSubview(errorLabel)
        contentView.addSubview(tryAgainButton)
        
        errorLabel.text = errorMessage
    }
    
    func setupLayout() {
        contentView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.right.equalTo(0)
        }
        
        errorIcon.snp.makeConstraints { (make) in
            make.centerX.equalTo(self)
            make.centerY.equalTo(contentView.snp.top)
            make.width.height.equalTo(80)
        }
        
        errorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(errorIcon.snp.bottom).offset(16)
            make.left.equalTo(16)
            make.right.equalTo(-16)
        }
        
        tryAgainButton.snp.makeConstraints { (make) in
            make.top.equalTo(errorLabel.snp.bottom).offset(16)
            make.width.equalTo(160)
            make.centerX.equalTo(self)
            make.height.equalTo(44)
            make.bottom.equalTo(contentView.snp.bottom)
        }
    }
}

//MARK: Actions
extension ErrorView {
    @objc
    func didTryAgainButtonClicked() {
        delegate?.isLoadingDataAgain()
        buttonAction?()
    }
}
