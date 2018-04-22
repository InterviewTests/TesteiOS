//
//  ViewController.swift
//  Santander
//
//  Created by Gabriel vieira on 4/21/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit


class ViewController: BaseViewController {

    @IBOutlet weak var label: UILabel!
    var test: Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func click(_ sender: Any) {
        
        var frame = self.label.frame
        
        if self.test {
//            frame.origin.y = 280
//            UIView.animate(withDuration: 0.1) {
//                self.label.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
//                self.label.frame = frame
//            }
            
            self.showLoader()

        } else {
//            frame.origin.y = 300
//            UIView.animate(withDuration: 0.1) {
//                self.label.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//                self.label.frame = frame
//            }
            
            self.hideLoader()
        }
        
        self.test = !self.test
    }
}

