//
//  DownloadButton.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import UIKit
import Eureka

class DownloadButton: UIButton {
    
    // MARK: - Vars
    typealias ButtonBlock = () -> Void
    private var block: ButtonBlock? {
        didSet {
            self.addTarget(self, action: #selector(onTapAction), for: .touchUpInside)
        }
    }
    
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
        setupDownloadImageButton()
        setupTitleLabel()
        setupEdges()
    }
    
    private func setupDownloadImageButton() {
        setImage(UIImage(named: "download-icon"), for: .normal)
        imageView?.contentMode = .scaleAspectFit
    }
    
    private func setupTitleLabel() {
        setTitle("Baixar", for: .normal)
        setTitleColor(UIColor.Santander.monza, for: .normal)
        titleLabel?.font = UIFont.santander(type: .regular, with: 14.0)
    }
    
    private func setupEdges() {
        let insetAmount: CGFloat = 8.0 / 2
        imageEdgeInsets = UIEdgeInsets(top: 0, left: -insetAmount, bottom: 0, right: insetAmount)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: insetAmount, bottom: 0, right: -insetAmount)
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
