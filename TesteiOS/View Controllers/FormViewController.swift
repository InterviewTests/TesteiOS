//
//  ViewController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

enum Type :Int {
    case field = 1
    case text = 2
    case image = 3
    case checkbox = 4
    case send = 5
}


class FormViewController: UIViewController {
    
    @IBOutlet weak var uiNameTextField: SkyFloatingLabelTextField?
    @IBOutlet weak var uiEmailTextField: SkyFloatingLabelTextField?
    @IBOutlet weak var uiPhoneTextField: SkyFloatingLabelTextField?
    
    private let acessibilityName = "Nome"
    private let acessibilityEmail = "Email"
    private let acessibilityPhone = "Telefone"
    
    var apiFetcher: Fetcher?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        apiFetcher?.fetch(request: Router.Form.get(params: "").asURLRequest()) { data in
            print(data)
            
            guard let data = data as? Data else {
                print("Error: No data to decode")
                return
            }
            
            let decoder = FormDecoder(data:data)
            decoder.decode()
            
            self.layoutTextFields(list:decoder.initializedFormObjects)

        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        uiNameTextField?.text = ""
        uiEmailTextField?.text = ""
        uiPhoneTextField?.text = ""
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    
    func layoutTextFields(list:[(spacing:Double,object:Any)]) {
        var allConstraints: [NSLayoutConstraint] = []
        var b = 0
        var views: [String: Any] = [:]
        for a in list {
            views["addView\(b)"] = a.object
            b += 1
        }
        
        guard let obj = list[0].object as? UIView else {
            return
        }
        obj.isUserInteractionEnabled = false
        var i = 1
        var horizontal = "H:|-40-[addView0]-40|"
        var vertical = "V:|-\(list[0].spacing)-[addView0]"
        
        var objs = list
        objs.remove(at: 0)
        objs.remove(at: list.count-2)
        for j in objs {
            vertical.append("-\(j.spacing)-[addView\(i)]")
            i += 1
        }
        
        vertical.append("-\(list[list.count-1].spacing)-[addView\(list.count-1)(50)]-60-|")
        var z = 0
        for k in list {
            
            guard let obj = k.object as? UIView else {
                return
            }
            obj.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(obj)
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[addView\(z)]-40-|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views)
            allConstraints += horizontalConstraints
            z += 1
        }
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat:vertical, options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views)
        allConstraints += verticalConstraints
        
        NSLayoutConstraint.activate(allConstraints)
        
        
        
        print(vertical)


        
//        NSLayoutConstraint.activate(allConstraints)
//
//        obj.translatesAutoresizingMaskIntoConstraints = false
//        self.view.addSubview(obj)
//        let view = ["addView":obj]
//        let spacing = list[0].spacing
//        print(obj)
//
//        let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[addView]-40-|", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: view)
//
//        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(spacing)-[addView]", options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: view)

//        allConstraints += verticalConstraints

        
        
        
//        view.addConstraints(horizontalConstraints)
//        view.addConstraints(verticalConstraints)
//        uiNameTextField?.layoutTextField(configText: self.name)
//        uiEmailTextField?.layoutTextField(configText: self.email)
//        uiPhoneTextField?.layoutTextField(configText: self.phone)
//
        uiNameTextField?.accessibilityLabel = self.acessibilityName
        uiEmailTextField?.accessibilityLabel = self.acessibilityEmail
        uiPhoneTextField?.accessibilityLabel = self.acessibilityPhone
    }
    
    
    @IBAction func recordMailBtnTap(_ sender: Checkbox) {
        sender.setSelected()
    }
    
    
    @IBAction func sendBtnTap(_ sender: Any) {
        
        print(verifyFormFilling())
        if (verifyFormFilling()) {
            dismissKeyboard()
            self.performSegue(withIdentifier: "sucess", sender: self)
        }
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    func verifyFormFilling() -> Bool {
        
        guard let name = uiNameTextField,
              let email = uiEmailTextField,
              let phone = uiPhoneTextField else {
            return false
        }
        
        if  name.hasErrorMessage || name.verifyEmptiness() || email.hasErrorMessage || email.verifyEmptiness() ||  phone.hasErrorMessage || phone.verifyEmptiness() {
            return false
        }

        return true
    }
}

