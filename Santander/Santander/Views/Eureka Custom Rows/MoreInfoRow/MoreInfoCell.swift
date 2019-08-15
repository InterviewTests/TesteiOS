//
//  MoreInfoCell.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

public class MoreInfoCell: Cell<String>, CellType {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.santander(type: .regular, with: 14.0)
        label.textAlignment = .left
        label.textColor = UIColor.Santander.silverChalice
        return label
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.santander(type: .regular, with: 14.0)
        label.textAlignment = .right
        label.textColor = UIColor.Santander.mineShaft
        return label
    }()
    
    // MARK: - Views
    public override func update() {
        titleLabel.text = row.title
        detailLabel.text = row.value
    }
    
    public override func setup() {
        super.setup()
        selectionStyle = .none
        height = { 32.0 }
        setupView()
    }
    
    private func setupView() {
        addTitleLabel()
        addDetailLabel()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(30.0)
        })
    }
    
    private func addDetailLabel() {
        contentView.addSubview(detailLabel)
        detailLabel.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(30.0)
        })
    }
}
