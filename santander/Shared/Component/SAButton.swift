//
//  SAButton.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SAButton: UIButton {
    
    public var buttonAction: (() -> Void)?
    
    private lazy var loaderView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    init(titled text: String) {
        super.init(frame: .zero)
        setTitle(text, for: .normal)
        buildViewCode()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public var isHighlighted: Bool {
        didSet {
            UIView.animate(withDuration: 0.2,
                           delay: 0,
                           options: [.beginFromCurrentState, .allowUserInteraction],
                           animations: {
                            
                            self.alpha = self.isHighlighted ? 0.5 : 1
            }, completion: nil)
        }
    }
    
    public override var bounds: CGRect {
        didSet {
            self.layer.cornerRadius = self.layer.frame.height / 2
            self.layer.masksToBounds = true
        }
    }
    
    private func setup() {
        backgroundColor = Resource.Color.red
        titleLabel?.font = Resource.Font.medium.of(size: 16)
        self.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc
    private func didTapButton() {
        buttonAction?()
    }
    
}

extension SAButton: ViewCoding {
    public func insertViews() {
        addSubview(loaderView)
    }
    
    public func setupConstraints() {
        loaderView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
    }
    
}

public extension SAButton {
    
    func startLoading() {
        loaderView.startAnimating()
        self.titleLabel?.alpha = 0
        self.isUserInteractionEnabled = false
    }
    
    func stopLoading() {
        loaderView.stopAnimating()
        self.titleLabel?.alpha = 1
        self.isUserInteractionEnabled = true
    }
    
}
