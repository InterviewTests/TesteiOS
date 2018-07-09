//
//  ViewSucesso.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit

protocol ViewSucessoDelegate {
    func buttonDismissClicked()
}

class ViewSucesso: UIView {
    
    // MARK: - @IBOutlet

    @IBOutlet var view: UIView!
    
    // MARK: - Class variabels
    
    var delegate: ViewSucessoDelegate? = nil
    
    // MARK: - UIView
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, delegate: ViewSucessoDelegate?) {
        super.init(frame: frame)
        UINib(nibName: "ViewSucesso", bundle: nil).instantiate(withOwner: self, options: nil)
        self.view.frame = frame
        self.addSubview(self.view)
        
        self.delegate = delegate
    }
    
    // MARK: - @IBAction
    
    @IBAction func dismissButtonClicked(_ sender: UIButton) {
        self.delegate?.buttonDismissClicked()
    }
}
