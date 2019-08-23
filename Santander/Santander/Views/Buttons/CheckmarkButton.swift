//
//  CheckmarkButton.swift
//  Santander
//
//  Created by Orlando Amorim on 11/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit
import Eureka

class CheckmarkButton: UIView {
    // MARK: - Dependencies
    enum State {
        case selected
        case unselected
        
        var image: UIImage {
            switch self {
            case .selected:
                return UIImage(named: "checkmark-selected-icon")!
            case .unselected:
                return UIImage(named: "checkmark-unselected-icon")!
            }
        }
    }
    
    private(set) var state: State
    
    // MARK: - Views
    private var checkmarkImage: UIImageView = {
        var imageView = UIImageView()
        return imageView
    }()
    
    private var textLabel: UILabel = {
        var label = UILabel()
        label.font = UIFont.santander(type: .regular, with: 16.0)
        label.textColor = UIColor.Santander.silverChalice
        return label
    }()
    
    // MARK: - Vars
    typealias ButtonBlock = (State) -> Void
    private var block: ButtonBlock?
    
    init(text: String, state: State = .unselected, frame: CGRect = .zero) {
        self.state = state
        super.init(frame: frame)
        textLabel.text = text
        setupView()
        setupTapGesture()
        update(to: state)
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
        addSubview(checkmarkImage)
        checkmarkImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview()
            make.height.width.equalTo(19.0)
        }
    }
    
    private func addTextLabel() {
        addSubview(textLabel)
        textLabel.snp.makeConstraints { [weak self] make in
            guard let self = self else {
                return
            }
            make.centerY.equalTo(self.checkmarkImage.snp.centerY)
            make.leading.equalTo(self.checkmarkImage.snp.trailing).inset(-9.0)
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
        let newState = state == State.unselected ? State.selected : State.unselected
        update(to: newState)
        block?(newState)
    }
    
    private func update(to state: State) {
        self.state = state
        checkmarkImage.image = state.image
    }
}

extension CheckmarkButton: SectionHeaderFooterRenderable {
    public func viewForItem() -> HeaderFooterViewRepresentable {
        self.translatesAutoresizingMaskIntoConstraints = false
        var footerView = HeaderFooterView<UIView>(.class)
        footerView.onSetupView = { [weak self] view, _ in
            guard let self = self else { return }
            view.addSubview(self)
            NSLayoutConstraint.activate([
                self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20.0),
                self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20.0),
                self.topAnchor.constraint(equalTo: view.topAnchor, constant: 47.0),
                self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
                ])
        }
        footerView.height = {
            47.0 + 21.0
        }
        return footerView
    }
}
