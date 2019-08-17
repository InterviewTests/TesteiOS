//
//  TitleSubtitleCell.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

public class TitleSubtitleCell: Cell<String>, CellType {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Views
    public override func update() {
        titleLabel.text = row.title
        subtitleLabel.text = row.value
    }
    
    public override func setup() {
        super.setup()
        selectionStyle = .none
        setupView()
    }
    
    private func setupView() {
        addTitleLabel()
        addSubtitleLabel()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ make in
            make.top.centerX.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(30.0)
        })
    }
    
    private func addSubtitleLabel() {
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints({ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).inset(-10.0)
            make.leading.trailing.equalTo(titleLabel)
            make.bottom.equalToSuperview()
        })
    }
}

