//
//  FormDecoder.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation


class FormDecoder {
    var data:Data
    
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
                    
                    if object.type == 1 {
                        print("placeholder")
                        print(object.message)
                    }
                    if object.type == 2 {
                        print("text label")
                        print(object.message)
                    }
                    if object.type == 4 {
                        print("checkbox")
                        print(object.message)
                        if let show = object.show {
                            print("mostrar campo")
                            for i in array.cells {
                                if(i.id == show) {
                                    print(i.message)
                                }
                            }
                        }
                        
                    }
                    if object.type == 5 {
                        print("Botão")
                        print(object.message)
                    }
                }
                
            }
            
        } catch {
            //  print(data.description)
            print(error)
            debugPrint("Error occurred")
        }
        

        
    }
    
    
    
}
