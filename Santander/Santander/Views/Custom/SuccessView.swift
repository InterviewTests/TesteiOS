//
//  SuccessView.swift
//  Santander
//
//  Created by Orlando Amorim on 13/08/19.
//

import UIKit
import SnapKit

class SuccessView: UIView {
    
    typealias ButtonBlock = () -> Void
    private var block: ButtonBlock? {
        didSet {
            sendNewMessage.addTarget(self, action: #selector(onTapAction), for: .touchUpInside)
        }
    }

    private var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private var sendNewMessage: UIButton = {
        let button = UIButton()
        button.setTitle("Enviar nova mensagem", for: .normal)
        button.setTitleColor(UIColor.Santander.monza, for: .normal)
        button.titleLabel?.font = UIFont.santander(type: .medium, with: 16.0)
        return button
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
        setupInfoLabel()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        isUserInteractionEnabled = true
        addInfoLabel()
        addSendNewButton()
        backgroundColor = .white
    }
    
    private func addInfoLabel() {
        addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
    private func addSendNewButton() {
        addSubview(sendNewMessage)
        sendNewMessage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalToSuperview().inset(87.0)
        }
    }
    
    private func setupInfoLabel() {
        let firstAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.Santander.gray,
                                                              .font: UIFont.santander(type: .medium, with: 14.0)]
        let secondAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: UIColor.Santander.mineShaft,
                                                              .font: UIFont.santander(type: .medium, with: 28.0)]
        
        let infoText = NSMutableAttributedString(string: "Obrigado!\n", attributes: firstAttributes)
        let secondString = NSAttributedString(string: "Mensagem enviada\ncom sucesso :)", attributes: secondAttributes)
        infoText.append(secondString)
        infoLabel.attributedText = infoText
    }
    
    // MARK: - Actions
    func onTap(_ block: @escaping ButtonBlock) {
        self.block = block
    }
    
    @objc private func onTapAction() {
        self.block?()
    }
}
