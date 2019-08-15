//
//  DownloadInfoCell.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

public class DownloadInfoCell<T: Equatable>: Cell<T>, CellType {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.santander(type: .regular, with: 14.0)
        label.textAlignment = .left
        label.textColor = UIColor.Santander.silverChalice
        return label
    }()
    
    var downloadButton: DownloadButton = {
        var button = DownloadButton()
        return button
    }()
    
    // MARK: - Views
    public override func update() {
        titleLabel.text = row.title
    }
    
    public override func setup() {
        super.setup()
        selectionStyle = .none
        height = { 32.0 }
        setupView()
    }
    
    private func setupView() {
        addTitleLabel()
        addDownloadButton()
    }
    
    private func addTitleLabel() {
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints({ make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().inset(30.0)
        })
    }
    
    private func addDownloadButton() {
        contentView.addSubview(downloadButton)
        downloadButton.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().inset(30.0)
        }
    }
}
