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
    
//    override func viewWillAppear(_ animated: Bool) {
//        uiNameTextField?.text = ""
//        uiEmailTextField?.text = ""
//        uiPhoneTextField?.text = ""
//    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    
    
    func getAllViews(fromList list:[(spacing:Double,object:Any)]) -> [String: Any] {
        
        var views: [String: Any] = [:]
        for (index,element) in list.enumerated() {
            views["addView\(index)"] = element.object

        }
        return views
    }
    
    
    func appendFields(vertical:String, views:Array<(spacing:Double,object:Any)>) -> String{
        var verticalAppend = vertical
        for (index,element) in views.enumerated() {
            verticalAppend.append("-\(element.spacing)-[addView\(index)]")
        }
        return verticalAppend
    }
    
    func addHorizontalConstraints(fromList list:[(spacing:Double,object:Any)],constraints:[NSLayoutConstraint], views:[String:Any]) -> [NSLayoutConstraint] {
        var allConstraints = constraints
        for (index,element) in list.enumerated() {
            guard let obj = element.object as? UIView else {
                return []
            }
            obj.translatesAutoresizingMaskIntoConstraints = false
            self.view.addSubview(obj)
            let horizontalConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|-40-[addView\(index)]-40-|", options: NSLayoutFormatOptions.alignAllCenterY, metrics: nil, views: views)
            allConstraints += horizontalConstraints
        }
        return allConstraints
    }
    
    func layoutTextFields(list:[(spacing:Double,object:Any)]) {
        var allConstraints: [NSLayoutConstraint] = []
        let views = getAllViews(fromList:list)
        
        guard let obj = list[0].object as? UIView else {
            return
        }
        obj.translatesAutoresizingMaskIntoConstraints = false
        obj.isUserInteractionEnabled = false
        
        var vertical = "V:|-\(list[0].spacing)-[addView0]"
        var objs = list
        objs.remove(at: 0)
        objs.remove(at: list.count-2)
        vertical =  appendFields(vertical: vertical, views:objs)
        vertical.append("-\(list[list.count-1].spacing)-[addView\(list.count-1)(50)]")
        
        allConstraints += addHorizontalConstraints(fromList: list, constraints: allConstraints, views: views)
        
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

    }
    
    
    @IBAction func recordMailBtnTap(_ sender: Checkbox) {
        sender.setSelected()
    }
    
//    @IBAction func sendBtnTap(_ sender: Any) {
//
//        print(verifyFormFilling())
//        if (verifyFormFilling()) {
//            dismissKeyboard()
//            self.performSegue(withIdentifier: "sucess", sender: self)
//        }
//    }
//
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

//    func verifyFormFilling() -> Bool {
//
//        guard let name = uiNameTextField,
//              let email = uiEmailTextField,
//              let phone = uiPhoneTextField else {
//            return false
//        }
//
//        if  name.hasErrorMessage || name.verifyEmptiness() || email.hasErrorMessage || email.verifyEmptiness() ||  phone.hasErrorMessage || phone.verifyEmptiness() {
//            return false
//        }
//
//        return true
//    }
}

