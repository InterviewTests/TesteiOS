//
//  FormAPI.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 04/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class FormAPI: NSObject
{
    func fetchFormData( URL: String, completionHandler: @escaping (Bool, String, FormModel?) -> Void)
    {
        let formModelToReturn = FormModel()
        
        // valida se a URL foi populada
        if URL == ""
        {
            completionHandler(false, "URL do formulário não foi definida", nil)
            return
        }
        
        let url = NSURL(string: URL)
        
        // faz o fetch do form
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                // obtém os elementos JSON e converte num array do objeto FormModel
                if let cellArray = jsonObj!.value(forKey: "cells") as? NSArray {
                    // loop através de todos os elementos
                    for cell in cellArray
                    {
                        // converte cada elemento em um NSDictionary
                        if let cellDict = cell as? NSDictionary
                        {
                            let thisFormModel = FormModel()

                            //
                            // testa cada elemento e o coloca no lugar certo dentro do objeto FormModel
                            //
                            
                            if let id = cellDict.value(forKey: "id") as? Int
                            {
                                thisFormModel.id = id
                            }
                            
                            if let type = cellDict.value(forKey: "type") as? Int
                            {
                                thisFormModel.type = type
                            }
                            
                            if let message = cellDict.value(forKey: "message") as? String
                            {
                                thisFormModel.message = message
                            }

                            if let typeField = cellDict.value(forKey: "typefield") as? Int
                            {
                                thisFormModel.typeField = typeField
                            }
                            // workaround para resolver problema de formato no arquivo JSON
                            else
                            {
                                if (cellDict.value(forKey: "typefield") as? String) != nil
                                {
                                    thisFormModel.typeField = 2
                                }
                            }
                            
                            if let hidden = cellDict.value(forKey: "hidden") as? Bool
                            {
                                thisFormModel.hidden = hidden
                            }
                            
                            if let topSpacing = cellDict.value(forKey: "topSpacing") as? Int
                            {
                                thisFormModel.topSpacing = topSpacing
                            }
                            
                            if let show = cellDict.value(forKey: "show") as? Int
                            {
                                thisFormModel.show = show
                            }
                            
                            if let required = cellDict.value(forKey: "required") as? Bool
                            {
                                thisFormModel.required = required
                            }
                            
                            // define um tag number para o campo
                            // esse tag será usado na UI para direcionar os eventos
                            thisFormModel.dataEntry.fieldTag = Int(arc4random_uniform(100000))

                            // adiciona o objeto ao array ElementosForm
                            formModelToReturn.ElementosForm.append(thisFormModel)
                        }
                    }
                    
                    completionHandler(true, "", formModelToReturn)
                    return
                }
                else
                {
                    completionHandler(false, "Formato JSON não compatível", nil)
                    return
                }
            }
            else
            {
                if let localizedError = error?.localizedDescription
                {
                    completionHandler(false, localizedError, nil)
                }
                else
                {
                    completionHandler(false, "Erro desconhecido", nil)
                }
                
                return
            }
        }).resume()
    }
}
