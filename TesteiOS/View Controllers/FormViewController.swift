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


class FormViewController: UIViewController, NextView {

    
   var apiFetcher: Fetcher?
   var formDecoder:FormDecoder?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadData()
    }
    
    
    func downloadData() {
        apiFetcher?.fetch(request: Router.Form.get(params: "").asURLRequest()) { data in
            print(data)
            
            guard let data = data as? Data else {
                print("Error: No data to decode")
                return
            }
            
            self.formDecoder = FormDecoder(data:data)
            self.formDecoder?.decode()
            
            guard let decodedObjs = self.formDecoder?.initializedFormObjects else {
                return
            }
            
            self.layoutTextFields(list:decodedObjs)
            self.uiButtonTap(fromList:decodedObjs)
            
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
      //  downloadData()
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
        
    }
    func uiButtonTap(fromList list:[(spacing:Double,object:Any)]) {
        for element in list {
            guard let btn = element.object as? RedButton else {
                continue
            }
            btn.delegate = self
        }
    }
    
    
    func getAllViews(fromList list:[(spacing:Double,object:Any)]) -> [String: Any] {
        
        var views: [String: Any] = [:]
        for i in 0..<list.count {
            print(list[i].object)
            views["addView\(i)"] = list[i].object
            
        }
        return views
    }
    
    
    func appendFields(vertical:String, views:Array<(spacing:Double,object:Any)>) -> String{
        var verticalAppend = vertical
        for (index,element) in views.enumerated() {
            verticalAppend.append("-\(element.spacing)-[addView\(index + 1)]")
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
       
        var vertical = "V:|-\(list[0].spacing)-[addView0]"
        var objs = list
        objs.remove(at: 0)
        objs.remove(at: list.count-2)
        vertical =  appendFields(vertical: vertical, views:objs)
        vertical.append("-\(list[list.count-1].spacing )-[addView\(list.count-1)(50)]")
        
        allConstraints += addHorizontalConstraints(fromList: list, constraints: allConstraints, views: views)
        
        let verticalConstraints = NSLayoutConstraint.constraints(withVisualFormat:vertical, options: NSLayoutFormatOptions.alignAllCenterX, metrics: nil, views: views)
        allConstraints += verticalConstraints
    
        NSLayoutConstraint.activate(allConstraints)
        print(vertical)


    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }

    
    func loadNewScreen(controller: UIViewController?) {
        if controller == nil {
            if let validation = formDecoder {
                if validation.checkFormValidation() {
                self.performSegue(withIdentifier: "sucess", sender: self)
                
                }
            }
        }
    }
    
    
}

