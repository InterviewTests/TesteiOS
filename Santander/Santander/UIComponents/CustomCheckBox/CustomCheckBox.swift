//
//  CustomCheckBox.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class CustomCheckBox: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    private var checkedImage = UIImage(named: "checkbox_on_icon")!
    private var uncheckedImage = UIImage(named: "checkbox_off_icon")!
    open var didChange: ((Bool) -> Void)?
    private var _checked: Bool = false {
        didSet {
            self.didChange?(_checked)
        }
    }
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    fileprivate func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        addSubview(view)
        self._checked = false
        self.setImage(animated: false)
    }
    
    fileprivate func viewFromNibForClass() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
        return view
    }
    
    func switchState() {
        _checked = !_checked
        setImage(animated: true)
    }
    
    func setState(_ state: Bool) {
        _checked = state
        setImage(animated: false)
    }
    
    func setText(text: String) {
        self.label.text = text
    }
    
    private func setImage(animated: Bool) {
        
        var image = self.uncheckedImage
        
        if _checked {
            image = self.checkedImage
        }
        
        if animated {
            
            UIView.animate(withDuration: 0.1,
               animations: {
                self.imageView.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
                self.imageView.image = image
            },
               completion: { _ in
                UIView.animate(withDuration: 0.1) {
                    self.imageView.transform = CGAffineTransform.identity
                }
            })
            
        } else {
            self.imageView.image = image
        }
        
    }
    
    var checked : Bool {
        return _checked
    }
    
    @IBAction func click(_ sender: Any) {
        self.switchState()
    }
}
