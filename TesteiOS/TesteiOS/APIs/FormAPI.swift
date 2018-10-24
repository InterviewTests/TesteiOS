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
    func fetchFormData( URL: String,
                        completionHandler: @escaping (FormModel?) -> Void,
                        completionHandlerError: @escaping(String?) -> Void){
        // valida se a URL foi populada
        if URL == ""{
            completionHandlerError(Constants.emptyURL)
            return
        }
        
        let url = NSURL(string: URL)
        
        // faz o fetch do form
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            // se houve erro (timeout ou qualquer outro tipo de falha na obtenção do JSON)
            if let thisError = error?.localizedDescription{
                completionHandlerError(thisError)
                return
            }
            else if let thisData = data{
                if let formModelToReturn = FormModel.init(data: thisData){
                    completionHandler(formModelToReturn)
                    return
                } else {
                    completionHandlerError(Constants.cannotParseJson)
                }
            }
            else {
                completionHandlerError(Constants.cannotRetrieveJson)
                return
            }

        }).resume()
    }
}
