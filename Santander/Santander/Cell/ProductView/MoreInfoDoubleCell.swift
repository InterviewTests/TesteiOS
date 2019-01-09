//
//  MoreInfoDoubleCell.swift
//  Santander
//
//  Created by Jonathan Martins on 07/01/19.
//  Copyright © 2019 Surrey. All rights reserved.
//

import UIKit

class MoreInfoDoubleCell: BaseCell {
    
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
    private let labelRight1: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// The right information of the cell
    private let labelRight2: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    /// Adds the constraints to the views in this cell
    private func setupConstraints(){
        self.contentView.addSubview(labelLeft)
        self.contentView.addSubview(labelRight1)
        self.contentView.addSubview(labelRight2)
        
        NSLayoutConstraint.activate([
            labelLeft.topAnchor    .constraint(equalTo: self.contentView.topAnchor    , constant:5),
            labelLeft.bottomAnchor .constraint(equalTo: self.contentView.bottomAnchor , constant:-15),
            labelLeft.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:15),
            
            labelRight1.widthAnchor.constraint(equalToConstant: 70),
            labelRight1.centerYAnchor.constraint(equalTo: labelLeft.centerYAnchor),
            labelRight1.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:-15),
            
            labelRight2.widthAnchor.constraint(equalToConstant: 70),
            labelRight2.centerYAnchor.constraint(equalTo: labelRight1.centerYAnchor),
            labelRight2.trailingAnchor.constraint(equalTo: labelRight1.leadingAnchor),
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
    func setupCell(for index:Int, profitability:Profitability?){
        switch index {
            case 0:
                labelLeft.text = "No mês"
            case 1:
                labelLeft.text = "No Ano"
            case 2:
                labelLeft.text = "12 mêses"
            default:
                return
        }
        
        if let cdi = profitability?.cdi{
            labelRight1.text = "\(cdi)"
        }
        
        if let fund = profitability?.fund{
            labelRight2.text = "\(fund)"
        }
    }
}
