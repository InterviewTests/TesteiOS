//
//  SantanderButton.swift
//  Santander
//
//  Created by Orlando Amorim on 11/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit
import Eureka

class SantanderButton: UIButton {
    
    typealias ButtonBlock = (SantanderButton) -> Void
    
    private var block: ButtonBlock? {
        didSet {
            self.addTarget(self, action: #selector(onTapAction(sender:)), for: .touchUpInside)
        }
    }
    
    var defaultBackgroundColor: UIColor = UIColor.Santander.monza
    var selectedBackgroundColor: UIColor = UIColor.Santander.apricot
    
    init(title: String? = nil, frame: CGRect = .zero) {
        super.init(frame: frame)
        setTitle(title, for: .normal)
        setupStyle()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupStyle() {
        layer.cornerRadius = 25.0
        setTitleColor(UIColor.white, for: .normal)
        backgroundColor = defaultBackgroundColor
        guard let titleLabel = titleLabel else { return }
        titleLabel.font = UIFont.santander(type: .medium, with: 16.0)
        titleLabel.textAlignment = .center
    }
    
    // MARK: - Highlighted
    override var isHighlighted: Bool {
        didSet {
            invalidateHighlightedAppearance()
        }
    }
    
    private func invalidateHighlightedAppearance() {
        UIView.animate(withDuration: 0.25, delay: 0.0, options: [.allowUserInteraction, .curveEaseOut], animations: { [weak self] in
            guard let self = self else { return }
            self.backgroundColor = self.isHighlighted ? self.selectedBackgroundColor : self.defaultBackgroundColor
            self.transform = self.isHighlighted ? CGAffineTransform(scaleX: 0.9, y: 0.9) : .identity
        })
    }
    
    // MARK: - Actions
    func onTap(_ block: @escaping ButtonBlock) {
        self.block = block
    }
    
    @objc func onTapAction(sender: SantanderButton) {
        self.block?(sender)
    }
}

extension SantanderButton: SectionHeaderFooterRenderable {
    public func viewForItem() -> HeaderFooterViewRepresentable {
        self.translatesAutoresizingMaskIntoConstraints = false
        var footerView = HeaderFooterView<UIView>(.class)
        footerView.onSetupView = { [weak self] view, _ in
            guard let self = self else { return }
            view.addSubview(self)
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30.0),
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30.0),
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: 45.0),
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40.0)
                ])
        }
        footerView.height = {
            45.0 + 50.0 + 40.0
        }
        return footerView
    }
}
