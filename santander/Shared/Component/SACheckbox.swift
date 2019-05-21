//
//  SACheckbox.swift
//  santander
//
//  Created by Jonatha Lima on 19/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SACheckbox: UIView {
    
    private lazy var checkboxButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setImage(Resource.Image.checkbox.image, for: .normal)
        button.addTarget(self,
                         action: #selector(didSelectCheckbox),
                         for: .touchUpInside)
        return button
    }()
    
    private lazy var checkboxTitleLabel: UILabel = {
        let label = UILabel()
        label.font = Resource.Font.regular.of(size: 16)
        label.textColor = .lightGray
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

extension SACheckbox: ViewCoding {
    
    public func insertViews() {
        addSubview(checkboxButton)
        addSubview(checkboxTitleLabel)
    }
    
    public func setupConstraints() {
        checkboxButton.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview()
            make.width.equalTo(19)
        }
        checkboxTitleLabel.snp.makeConstraints { make in
            make.left.equalTo(checkboxButton.snp.right).offset(9)
            make.top.right.bottom.equalToSuperview()
        }
    }
    
}

extension SACheckbox {
    
    internal struct Configuration {
        var title: String
    }
    
    private func configure(data: Configuration) {
        checkboxTitleLabel.text = data.title
    }
    
}

extension SACheckbox {
    
    @objc
    private func didSelectCheckbox() {
        
        guard let currentImage = checkboxButton.currentImage,
            currentImage == Resource.Image.checkbox.image else {
                setCheckbox(filled: false)
                return
        }
        
        setCheckbox(filled: true)
    }
    
    func setCheckbox(filled: Bool) {
        
        guard filled else {
            checkboxButton
                .setImage(Resource.Image.checkbox.image, for: .normal)
            return
        }
        
        self.checkboxButton
            .setImage(Resource.Image.checkboxFilled.image, for: .normal)
    }
    
}
