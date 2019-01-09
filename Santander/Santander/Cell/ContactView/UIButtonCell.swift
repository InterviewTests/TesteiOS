//
//  UIButtonCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class UIButtonCell: BaseCell {
    
    /// The Button
    let button: UIButton = {
        let button = UIButton()
        button.setTitleColor(.white, for: .normal)
        button.cornerRadius = 15
        button.backgroundColor = .red
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(button)
        
        topSpacing = button.topAnchor.constraint(equalTo: self.contentView.topAnchor)
        NSLayoutConstraint.activate([
            button.heightAnchor .constraint(equalToConstant: 35),
            button.bottomAnchor .constraint(equalTo: self.contentView.bottomAnchor, constant: -30),
            button.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            button.widthAnchor  .constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/1.3),
            topSpacing!
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// Sets up the cell information
    func setupCell(_ item:FormItem, callback:(()->Void)? = nil){
        setupTopSpace(item)
        self.item     = item
        self.callback = callback
        
        button.setTitle("Enviar", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchUpInside)
    }
    
    /// Sets the callback to notify the controller
    func setCallback(_ callback:@escaping (()->Void)){
        self.callback = callback
        
        topSpacing?.constant = 20
        button.setTitle("Investir", for: .normal)
        button.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchUpInside)
    }
    
    /// Callback to notify the Controller when the button is clicked
    private var callback:(()->Void)?
    @objc private func buttonClicked(myButton: UIButton) {
        callback?()
    }
}
