//
//  StatementAPI.swift
//  teste-ios
//
//  Created by marcio-mac on 25/07/19.
//  Copyright © 2019 marcio-mac. All rights reserved.
//

import UIKit
import Alamofire

class StatementAPI {
    
    static func BuscarStatement(id:Int, completionBlock: @escaping ((_ returnValue: RetornoLista?) -> Void))
    {
        Alamofire.request("https://bank-app-test.herokuapp.com/api/statements/\(id)",method: .get).responseJSON{
            response in switch response.result {
            case .success:
                
                if let data = response.data {
                    let statementList = try? JSONDecoder().decode(RetornoLista.self, from: data)
                    completionBlock(statementList)
                }
                
            case .failure(let error):
                print("Request failed with error: \(error)")
                completionBlock(nil)
            }
        }
    }
    
    struct StatementReturn: Codable {
        let title: String?
        let desc: String?
        let date: String?
        let value: Double?
    }
        
    struct RetornoLista: Codable {
        let error : Error
        let statementList: [Statement]
    }
   
    struct Error: Codable {
        let code: Int?
        let message: String?
    }
    

        
        
//        var retorno:Array<Statement> = []
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        let aux = dateFormatter.date(from: "2018-08-15")
//        retorno.append(Statement(title: "Pagamento", desc: "Conta de luz", date: dateFormatter.date(from: "2018-08-15")!, value: -50))
//        retorno.append(Statement(title: "Pagamento", desc: "Conta de luz", date: dateFormatter.date(from: "2018-08-15")!, value: -50))
//        retorno.append(Statement(title: "Pagamento", desc: "Conta de luz", date: dateFormatter.date(from: "2018-08-15")!, value: -50))
//        retorno.append(Statement(title: "Pagamento", desc: "Conta de luz", date: dateFormatter.date(from: "2018-08-15")!, value: -50))
//        retorno.append(Statement(title: "Pagamento", desc: "Conta de luz", date: dateFormatter.date(from: "2018-08-15")!, value: -50))
//        retorno.append(Statement(title: "Pagamento", desc: "Conta de luz", date: dateFormatter.date(from: "2018-08-15")!, value: -50))
        
        
//        return retorno
    
    
}
