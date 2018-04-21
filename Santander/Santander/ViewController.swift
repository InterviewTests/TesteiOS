//
//  ViewController.swift
//  Santander
//
//  Created by Gabriel vieira on 4/21/18.
//  Copyright © 2018 Gabriel vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var test_label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let customFont = UIFont(name: "DINPro-Bold", size: 17) else {
            fatalError("""
        Failed to load the "CustomFont-Light" font.
        Make sure the font file is included in the project and the font name is spelled correctly.
        """
            )
        }
        self.test_label.font = UIFontMetrics.default.scaledFont(for: customFont)
        self.test_label.adjustsFontForContentSizeCategory = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

