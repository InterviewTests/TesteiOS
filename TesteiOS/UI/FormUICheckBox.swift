//
//  FormUICheckBox.swift
//  TesteiOS
//
//  Created by Andre Paganin on 04/09/18.
//  Copyright © 2018 Andre Paganin. All rights reserved.
//

import Foundation
import UIKit
import BEMCheckBox
import RxSwift
import RxCocoa

class RxBEMCheckBoxDelegateProxy: DelegateProxy<BEMCheckBox, BEMCheckBoxDelegate>, BEMCheckBoxDelegate, DelegateProxyType {

    init(checkBox: BEMCheckBox) {
        super.init(parentObject: checkBox, delegateProxy: RxBEMCheckBoxDelegateProxy.self)
    }

    static func registerKnownImplementations() {
        self.register { RxBEMCheckBoxDelegateProxy(checkBox: $0) }
    }

    static func currentDelegate(for object: BEMCheckBox) -> BEMCheckBoxDelegate? {
        return object.delegate
    }

    static func setCurrentDelegate(_ delegate: BEMCheckBoxDelegate?, to object: BEMCheckBox) {
        object.delegate = delegate
    }
}

extension Reactive where Base: BEMCheckBox {

    var delegateProxy: DelegateProxy<BEMCheckBox, BEMCheckBoxDelegate> {
        return RxBEMCheckBoxDelegateProxy.proxy(for: base)
    }

    var selectionChanged: Observable<Bool> {
        return delegateProxy
            .methodInvoked(#selector(BEMCheckBoxDelegate.didTap(_:)))
            .map { ($0[0] as! BEMCheckBox).on }
    }

}

public class FormUICheckBox: UIView {

    public var title: String? {
        didSet {
            setupTitle()
        }
    }

    public var titleColor: UIColor = .black {
        didSet {
            self.titleLabel.textColor = titleColor
        }
    }

    public var titleLabel = UILabel()

    public let checkBox = BEMCheckBox()

    public init() {
        super.init(frame: .zero)
        setupCheckBoxConstraints()
        setupTitleConstraints()
    }

    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupTitle() {
        self.titleLabel.text = title
    }

    private func setupCheckBoxConstraints() {
        let parentMarginsGuide = self.layoutMarginsGuide

        self.addSubview(checkBox)
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        checkBox.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        checkBox.leadingAnchor.constraint(equalTo: parentMarginsGuide.leadingAnchor).isActive = true
        checkBox.heightAnchor.constraint(equalToConstant: 15.0).isActive = true
        checkBox.widthAnchor.constraint(equalTo: checkBox.heightAnchor, multiplier: 1.0).isActive = true
    }

    private func setupTitleConstraints() {
        self.addSubview(titleLabel)
        let parentMarginsGuide = self.layoutMarginsGuide
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: parentMarginsGuide.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: parentMarginsGuide.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: checkBox.trailingAnchor, constant: 8.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.0).isActive = true
    }
}



