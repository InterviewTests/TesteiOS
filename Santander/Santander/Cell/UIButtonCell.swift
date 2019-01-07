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
        button.setTitle("Enviar", for: .normal)
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
            button.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
            button.widthAnchor  .constraint(equalTo: self.contentView.widthAnchor, multiplier: 1/1.2),
            topSpacing!
            //button.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant:15),
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    ///
    func setupCell(item:FormItem){
        topSpacing?.constant = CGFloat(item.topSpacing ?? 0)
    }
}
