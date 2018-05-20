//
//  ViewController.swift
//  SantanderTestApp
//
//  Created by Frederico Franco on 18/05/18.
//  Copyright © 2018 Frederico Franco. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let t = TextField(frame: .zero)
        view.addSubview(t)
        t.input = MyInput(title: "Testando", typedText: nil, isValid: nil, isTextFieldActive: false)
        t.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    struct MyInput: TextFieldInput {
        var title: String
        var typedText: String?
        var isValid: Bool?
        var isTextFieldActive: Bool = false
    }

}

