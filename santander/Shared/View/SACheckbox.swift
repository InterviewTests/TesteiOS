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
    
    init() {
        super.init(frame: .zero)
        buildViewCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SACheckbox: ViewCoding {
    
    public func insertViews() {
        addSubview(checkboxButton)
    }
    
    public func setupConstraints() {
        checkboxButton.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}

extension SACheckbox {
    
    @objc
    private func didSelectCheckbox() {
        
        guard let currentImage = checkboxButton.currentImage,
            currentImage == Resource.Image.checkbox.image else {
                setCheckbox(filled: true)
                return
        }
        
        setCheckbox(filled: false)
    }
    
    func setCheckbox(filled: Bool) {
        
        guard filled else {
            checkboxButton.setImage(Resource.Image.checkbox.image, for: .normal)
            return
        }
        
        checkboxButton.setImage(Resource.Image.checkboxFilled.image, for: .normal)
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
        
    }
    
}
