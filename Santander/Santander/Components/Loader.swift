//
//  Loader.swift
//  Santander
//
//  Created by Gabriel vieira on 4/21/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class LoaderView: UIView {
    
    var currentView: UIView
    var backgroundView: UIView
    var spinner: NVActivityIndicatorView
    
    init(currentView: UIView) {
        
        let screenSize: CGRect = UIScreen.main.bounds
        self.currentView = currentView
        self.backgroundView = UIView.init(frame: screenSize)
        self.backgroundView.backgroundColor = Color.gray
        self.backgroundView.alpha = 0.35
        
        self.spinner = NVActivityIndicatorView.init(frame: CGRect(x: (screenSize.width/2) - 25, y: (screenSize.height/2) - 25, width: 50, height: 50), type: .circleStrokeSpin, color: .red, padding: 0)
        super.init(frame: screenSize)
        self.addSubview(self.backgroundView)
        self.addSubview(self.spinner)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func startAnimation() {
        self.stopAnimating()
        self.currentView.isUserInteractionEnabled = false
        self.currentView.addSubview(self)
        self.spinner.startAnimating()
    }
    
    func stopAnimating() {
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .transitionCrossDissolve, animations: {
            self.spinner.stopAnimating()
            self.removeFromSuperview()
            self.currentView.isUserInteractionEnabled = true
        })
    }
}
