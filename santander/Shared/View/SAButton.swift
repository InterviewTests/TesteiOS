//
//  SAButton.swift
//  santander
//
//  Created by Jonatha Lima on 18/05/19.
//  Copyright © 2019 anonymous. All rights reserved.
//

import UIKit

public class SAButton: UIButton {
    
    private lazy var loaderView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        return activityIndicatorView
    }()
    
    public var isRounded: Bool = false {
        didSet {
            self.layer.cornerRadius = isRounded ?
                self.layer.frame.height / 2 : 0
        }
    }
    
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
            UIView.animate(withDuration: 0.25,
                           delay: 0,
                           options: [.beginFromCurrentState, .allowUserInteraction],
                           animations: {
                            
                            self.alpha = self.isHighlighted ? 0.5 : 1
            }, completion: nil)
        }
    }
    
    private func setup() {
        // TODO: Use colors custom
        backgroundColor = .red
        titleLabel?.font = Resource.Font.medium.of(size: 16)
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
