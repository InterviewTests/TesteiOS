//
//  CustomCheckBoxView.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 25/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class CustomCheckBoxView: UIView, ConfigurableView {
    
    
    let imageCheck: UIImageView = {
        let image = UIImageView(image: UIImage(named: "checkbox"), highlightedImage: UIImage(named: "checkbox_filled"))
        let tap = UITapGestureRecognizer(target: self, action: #selector(changeImage))
        image.addGestureRecognizer(tap)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    let messageLabel = UILabel(textColor: .lightGray, font: UIFont(name: "Arial", size: 18))
    
    convenience init(message: String) {
        self.init()
        messageLabel.text = message
        buildViewHierarchy()
        setupConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        buildViewHierarchy()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buildViewHierarchy() {
        addSubviews([imageCheck, messageLabel])
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            imageCheck.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            imageCheck.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            imageCheck.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            imageCheck.widthAnchor.constraint(equalToConstant: 20),
            
            messageLabel.leadingAnchor.constraint(equalTo: imageCheck.trailingAnchor, constant: 10),
            messageLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }
    
    @objc func changeImage() {}
}
