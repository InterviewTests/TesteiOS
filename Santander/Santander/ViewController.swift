//
//  ViewController.swift
//  Santander
//
//  Created by Gabriel vieira on 4/21/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var test: Bool = true
    let spinner = NVActivityIndicatorView.init(frame: CGRect(x: 200, y: 200, width: 50, height: 50), type: .circleStrokeSpin, color: .red, padding: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(spinner)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func click(_ sender: Any) {
        

        
        
        var frame = self.label.frame
        
        if self.test {
            frame.origin.y = 280
            UIView.animate(withDuration: 0.1) {
                self.label.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
                self.label.frame = frame
            }
            
            self.spinner.startAnimating()
        } else {
            frame.origin.y = 300
            UIView.animate(withDuration: 0.1) {
                self.label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.label.frame = frame
            }
            
            self.spinner.stopAnimating()
        }
        
        self.test = !self.test
    }
}

