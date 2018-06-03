//
//  FormDecoder.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import SkyFloatingLabelTextField


class FormDecoder {
    let data:Data
    var formObjects:[(spacing:Double,type:Int,text:String)] = []
    var initializedFormObjects:[(spacing:Double,object:Any)] = []
    
    init(data:Data) {
        self.data = data
    }
    
    func decode() {
        let decoder = JSONDecoder()
        do {
            let array = try decoder.decode(FormArray.self, from: self.data)
            debugPrint(array)
            for object in array.cells {
                if !object.hidden {
                    formObjects.append((object.topSpacing,object.type,text:object.message))
                    if let show = object.show {
                        for i in array.cells {
                            if (i.id == show) {
                                formObjects.append((i.topSpacing,i.type,text:i.message))
                            }
                        }
                    }

                }
                
            }
            assembleForm()
        } catch {
            //  print(data.description)
            print(error)
            debugPrint("Error occurred")
        }
    }
    
    
    func assembleForm() {
        
        for i in formObjects {
            switch i.type {
                case Type.field.rawValue:
                        print("text-field")
                        let textField = SkyFloatingLabelTextField()

                        textField.layoutTextField(configText: i.text)
                        initializedFormObjects.append((spacing:i.spacing,object:textField))
                case Type.text.rawValue:
                        print("text label")
                        let label = UILabel()
                        label.numberOfLines = 0
                        label.text = i.text
                        initializedFormObjects.append((spacing: i.spacing,object:label))
                case Type.image.rawValue:
                        print("nothing")
                case Type.checkbox.rawValue:
                        let button = Checkbox()
                        button.setTitle(i.text, for: UIControlState.normal)
                        button.setSelected()

                        initializedFormObjects.append((spacing: i.spacing,object:button))
                
                case Type.send.rawValue:
                        let button = RedButton()
                        button.setTitle(i.text, for: UIControlState.normal)
                        initializedFormObjects.append((spacing:i.spacing,object:button))
            default:
                print("none")
            }
        }
        
    }
}
