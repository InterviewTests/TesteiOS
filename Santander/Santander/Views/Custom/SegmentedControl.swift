//
//  SegmentedControl.swift
//  Santander
//
//  Created by Orlando Amorim on 10/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit
import SnapKit

class SegmentedControl: UIView {
    
    typealias Button = (title: String, isSelected: Bool)
    typealias ButtonBlock = (_ selectedIndex: Int) -> Void
    private var block: ButtonBlock?
    
    private var buttons: [UIButton] = []
    private var selectorView: UIView!
    private var selectedIndex: Int = 0
    
    var textColor: UIColor = .white
    var selectedColor: UIColor = UIColor.Santander.guardsmanRed
    var unselectedColor: UIColor = UIColor.Santander.monza
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        updateSelectorView()
    }
    
    private func setupView() {
        backgroundColor = .white
        setupStackView()
        setupSelectorView()
    }
    
    func set(buttons: [Button]) {
        updateView(with: buttons)
    }
    
    func onTap(_ block: @escaping ButtonBlock) {
        self.block = block
    }
    
    @objc func onTapAction(sender: UIButton) {
        guard let index = buttons.firstIndex(of: sender) else {
            return
        }
        didSelected(index: index)
    }
    
    func didSelected(index: Int) {
        buttons.forEach({ $0.backgroundColor = unselectedColor })
        let selectorPosition = frame.width / CGFloat(self.buttons.count) * CGFloat(index)
        UIView.animate(withDuration: 0.3) { [weak self] in
            guard let self = self else {
                return
            }
            self.block?(index)
            self.selectedIndex = index
            self.buttons[index].backgroundColor = self.selectedColor
            self.selectorView.frame.origin.x = selectorPosition
        }
    }
}

// MARK: - Factory
extension SegmentedControl {
    
    private func updateView(with buttons: [Button]) {
        create(with: buttons)
        updateStackView()
        updateSelectorView()
    }
    
    private func create(with buttons: [Button]) {
        self.buttons.removeAll()
        var selectedIndex = 0
        buttons.enumerated().forEach { [weak self] index, button in
            if let self = self {
                let newButton = self.createButton(with: button)
                selectedIndex = button.isSelected ? index : selectedIndex
                self.buttons.append(newButton)
            }
        }
        didSelected(index: selectedIndex)
    }
    
    private func createButton(with button: Button) -> UIButton {
        let newButton = UIButton(type: .system)
        newButton.setTitle(button.title, for: .normal)
        newButton.addTarget(self, action: #selector(onTapAction(sender:)), for: .touchUpInside)
        newButton.setTitleColor(textColor, for: .normal)
        newButton.backgroundColor = button.isSelected ? selectedColor : unselectedColor
        newButton.titleLabel?.font = UIFont.santander(type: .medium, with: 16.0)
        return newButton
    }
    
    private func updateSelectorView() {
        let selectorPosition = frame.width / CGFloat(self.buttons.count) * CGFloat(selectedIndex)
        let selectorWidth = frame.width / CGFloat(self.buttons.count)
        selectorView.frame = CGRect(x: selectorPosition, y: 0.0, width: selectorWidth.isNaN ? 0.0 : selectorWidth, height: 2)
    }
    
    private func setupSelectorView() {
        let selectorWidth = frame.width / CGFloat(self.buttons.count)
        selectorView = UIView(frame: CGRect(x: 0.0, y: 0.0, width: selectorWidth.isNaN ? 0.0 : selectorWidth, height: 2))
        selectorView.backgroundColor = unselectedColor
        addSubview(selectorView)
    }
    
    private func updateStackView() {
        stackView.removeAllArrangedSubviews()
        buttons.forEach({ stackView.addArrangedSubview($0) })
    }
    
    private func setupStackView() {
        addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(2.0)
            make.leading.trailing.bottom.equalToSuperview()
        }
    }
}
