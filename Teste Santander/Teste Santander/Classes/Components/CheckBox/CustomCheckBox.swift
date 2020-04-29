//
//  CustomCheckBox.swift
//  Teste Santander
//
//  Created by Eduardo Alves Sumiya on 28/04/20.
//  Copyright © 2020 Eduardo Alves Sumiya. All rights reserved.
//

import UIKit
protocol CustomCheckBoxDelegate {
    /// Check Box Check Event
    /// - Parameter isSelected: checkbox state
    func didCheck(isSelected: Bool)
}

class CustomCheckBox: UIView {
    // MARK: - Properties
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var btnCheck: UIButton!
    @IBOutlet weak var lblCheckDescription: UILabel!
    
    // MARK: - Control State Variables
    var isSelected: Bool = false
    
    // MARK: - Delegate
    var delegate: CustomCheckBoxDelegate?
    
    // MARK: - Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initNib()
        configureUI()
    }
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        initNib()
        configureUI()
    }
    
    override func awakeFromNib() {
        super .awakeFromNib()
        
        configureUI()
    }
    
    // MARK: - PrivateMethods
    fileprivate func initNib() {
        let bundle = Bundle(for: CustomCheckBox.self)
        bundle.loadNibNamed(String(describing: CustomCheckBox.self), owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = bounds
        containerView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    fileprivate func configureUI() {
        btnCheck.layer.borderWidth = 1
        btnCheck.layer.borderColor = #colorLiteral(red: 0.5921568627, green: 0.5921568627, blue: 0.5921568627, alpha: 1).cgColor
        btnCheck.bezierPathBorder(.white, width: 2)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didCheck(_:)))
        containerView.addGestureRecognizer(tapGesture)
    }
    
    // MARK: - Public Methods
    func setup(checkBoxText: String, isSelected: Bool = false) {
        lblCheckDescription.text = checkBoxText
        self.isSelected = isSelected
        btnCheck.backgroundColor = isSelected ? #colorLiteral(red: 0.8550000191, green: 0.00400000019, blue: 0.00400000019, alpha: 1) : .white
    }
    
    // MARK: - Gesture Methods
    @objc func didCheck(_ sender: UITapGestureRecognizer?) {
        isSelected = !isSelected
        btnCheck.backgroundColor = isSelected ? #colorLiteral(red: 0.8550000191, green: 0.00400000019, blue: 0.00400000019, alpha: 1) : .white
        delegate?.didCheck(isSelected: isSelected)
    }
}
