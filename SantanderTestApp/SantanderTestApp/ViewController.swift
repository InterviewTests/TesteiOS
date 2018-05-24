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
        
        let model = TextFieldModel(title: "Testando", typedText: "")
        let t = TextField(model: model)
        view.addSubview(t)
        t.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(50)
        }
        
        let button = UIButton(type: .contactAdd)
        self.view.addSubview(button)
        button.snp.makeConstraints {
            $0.bottom.trailing.equalToSuperview()
        }
        
        button.addTarget(self, action: #selector(didTapOnButton(_:)), for: .touchUpInside)
    }
    
    
    @objc func didTapOnButton(_ sender: UIButton) {
        
        let nameField = TextFieldModel(title: "Nome", typedText: "")
        let emailField = TextFieldModel(title: "Email", typedText: "")
        let phoneField = TextFieldModel(title: "Phone", typedText: "")
        
        let contactModel = ContactViewControllerModel(nameField: nameField, emailField: emailField, phoneField: phoneField)
        let vc = ContactViewController(model: contactModel)
        
        present(vc, animated: true, completion: nil)
    }

}

