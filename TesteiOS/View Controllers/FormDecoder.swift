//
//  FormDecoder.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import SkyFloatingLabelTextField


class FormDecoder :HideField {

    
    let data:Data
    var formObjects:[(spacing:Double,type:Int,text:String,id:Int,show:Int?)] = []
    var initializedFormObjects:[(spacing:Double,id:Int?,object:Any)] = []
    var validation:Array<(text:String,error:Bool,field:SkyFloatingLabelTextField)> = []
    
    init(data:Data) {
        self.data = data
        
    }
    
    func decode() {
        let decoder = JSONDecoder()
        do {
            let array = try decoder.decode(FormArray.self, from: self.data)
            debugPrint(array)
            for object in array.cells {
//                if !object.hidden {
                formObjects.append((object.topSpacing,object.type,text:object.message,id:object.id,show:object.show))
//                    if let show = object.show {
//                        for i in array.cells {
//                            if (i.id == show) {
//
//                                formObjects.append((i.topSpacing,i.type,text:i.message))
//                            }
//                        }
//                    }

                }
                
//            }
            assembleForm()
        } catch {
            //  print(data.description)
            print(error)
            debugPrint("Error occurred")
        }
    }
    
    
    func assembleForm() {
        
        for i in formObjects {
            print(i.type)
            switch i.type {
                case Type.field.rawValue:
                        let textField = SkyFloatingLabelTextField()
                        textField.layoutTextField(configText: i.text)
                        initializedFormObjects.append((spacing:i.spacing,id:i.id,object:textField))
                case Type.text.rawValue:
                        let label = UILabel()
                        label.numberOfLines = 0
                        label.text = i.text
                        label.font = UIFont(name:"DINPro", size: 16)
                        initializedFormObjects.append((spacing: i.spacing,id:i.id,object:label))
                case Type.image.rawValue:
                        print("nothing")
                case Type.checkbox.rawValue:
                    
                        let button = Checkbox(show:i.show)
                    
                        button.setTitle("   " + i.text, for: UIControlState.normal)
                        button.delegate = self
                        initializedFormObjects.append((spacing: i.spacing,id:i.id,object:button))
                case Type.send.rawValue:
                        let button = RedButton()
                        button.setTitle(i.text, for: UIControlState.normal)
                        initializedFormObjects.append((spacing:i.spacing,id:i.id,object:button))
            default:
                print("none")
            }
        }
        
    }
    
    func getTextFields() {
        validation = []
        for i in initializedFormObjects {
            guard let obj = i.object as? SkyFloatingLabelTextField else {
                continue
            }
            guard let text = obj.text else {
                continue
            }
            
            guard let view = i.object as? UIView else {
                continue
            }
            if !view.isHidden {
            if obj.hasErrorMessage || text.isEmpty  {
                validation.append((text:text,error:obj.hasErrorMessage,field:obj))
            }
            }
            
        }
        
    }
    
    func checkFormValidation() -> Bool {
        getTextFields()
        if validation.isEmpty {
            return true
        } else {
            return false
        }
        
    }
    func hideField(shouldHide: Bool, field: Int?) {
        guard let fieldToShow = field else {
            return
        }
        for i in initializedFormObjects {
            if(fieldToShow == i.id) {
                guard let view =  i.object as? UIView else {
                    continue
                }
                view.isHidden = shouldHide
            }
        }
        

    }
    
}
