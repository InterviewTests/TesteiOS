//
//  DownloadButton.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

class DownloadButton: UIView {
    
    // MARK: - Views
    private var downloadImage: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "download-icon"))
        return imageView
    }()
    
    private var textLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.santander(type: .regular, with: 14.0)
        label.textColor = UIColor.Santander.monza
        label.text = "Baixar"
        return label
    }()
    
    // MARK: - Vars
    typealias ButtonBlock = () -> Void
    private var block: ButtonBlock?
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
        setupTapGesture()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        addCheckmarkButton()
        addTextLabel()
    }
    
    private func addCheckmarkButton() {
        addSubview(downloadImage)
        downloadImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(13.0)
        }
    }
    
    private func addTextLabel() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            make.centerY.equalTo(self.downloadImage.snp.centerY)
            make.leading.equalTo(self.downloadImage.snp.trailing).inset(-8.0)
            make.trailing.equalToSuperview()
        }
    }
    
    // MARK: - Actions
    private func setupTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTapAction))
        addGestureRecognizer(tap)
    }
    
    func onTap(_ block: @escaping ButtonBlock) {
        self.block = block
    }
    
    @objc private func onTapAction() {
        block?()
    }
}
