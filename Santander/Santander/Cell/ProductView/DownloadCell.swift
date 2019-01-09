//
//  DownloadCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class DownloadCell: BaseCell {
    
    /// The left information of the cell
    private let labelLeft: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .lightGray
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    /// The right information of the cell
    private let icon: UIImageView = {
        let icon = UIImageView()
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    /// The button to download
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Baixar", for: .normal)
        button.setTitleColor(.red, for: .normal)
        button.backgroundColor = .clear
        button.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(icon)
        self.contentView.addSubview(button)
        self.contentView.addSubview(labelLeft)
        
        NSLayoutConstraint.activate([
            labelLeft.topAnchor    .constraint(equalTo: self.contentView.topAnchor    , constant:5),
            labelLeft.bottomAnchor .constraint(equalTo: self.contentView.bottomAnchor , constant:-10),
            labelLeft.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:15),
            
            button.widthAnchor .constraint(equalToConstant: 70),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerYAnchor.constraint(equalTo: labelLeft.centerYAnchor),
            button.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            
            icon.widthAnchor .constraint(equalToConstant: 20),
            icon.heightAnchor.constraint(equalToConstant: 20),
            icon.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            icon.trailingAnchor.constraint(equalTo: button.leadingAnchor),
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
    func setupCell(for info:Info?, callback:(()->Void)?=nil){
        self.callback  = callback
        labelLeft.text = info?.name
        button.addTarget(self, action: #selector(buttonClicked), for: UIControl.Event.touchUpInside)
    }
    
    /// Callback to notify the Controller when the button is clicked
    private var callback:(()->Void)?
    @objc private func buttonClicked(myButton: UIButton) {
        callback?()
    }
}
