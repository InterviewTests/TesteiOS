//
//  NetworkAPI.swift
//  TesteiOS
//
//  Created by Tiago Leme on 01/08/18.
//  Copyright © 2018 Tiago Leme. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkAPI {
    
    func fetchCellInfo(completion: @escaping ([DynamicCell]) -> Void) {
        
        guard let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json") else {
            print("Failure at url parsing.")
            return
        }
        
        Alamofire.request(url).validate().responseJSON(){ response in
            
            guard response.result.isSuccess else {
                print("Failure at https request: \(response.error!.localizedDescription)")
                return
            }
            
            guard let data = try? JSON(data: response.data!) else {
                print("Failure at JSON parsing.")
                return
            }
            
            
            
            let dynamicCells = data["cells"].map({
                DynamicCell(id: $0.1["id"].intValue,
                            type: $0.1["type"].intValue,
                            message: $0.1["message"].stringValue,
                            typeField: $0.1["typefield"].int,
                            hidden: $0.1["hidden"].boolValue,
                            topSpacing: $0.1["topSpacing"].intValue,
                            show: $0.1["show"].int,
                            isRequired: $0.1["required"].boolValue)
            })
            
            if dynamicCells.isEmpty {
                print("Failure creating DynamicCell Object")
                return
            }
            
            completion(dynamicCells)
        }
    }
    
    func fetchFundInfo(completion: @escaping (InvestmentFund?) -> Void) {
        
        guard let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json") else {
            print("Failure at url parsing.")
            return
        }
        
        Alamofire.request(url).validate().responseJSON(){ response in
            
            guard response.result.isSuccess else {
                print("Failure at https request: \(response.error!.localizedDescription)")
                return
            }
            
            guard let data = try? JSON(data: response.data!) else {
                print("Failure at JSON parsing.")
                return
            }
            
            let investmentFund = InvestmentFund(fundTitle: data["screen"]["title"].stringValue,
                                                fundName: data["screen"]["fundName"].stringValue,
                                                whatIs: data["screen"]["whatIs"].stringValue,
                                                definition: data["screen"]["definition"].stringValue,
                                                riskTitle: data["screen"]["riskTitle"].stringValue,
                                                risk: data["screen"]["risk"].intValue,
                                                infoTitle: data["screen"]["infoTitle"].stringValue,
                                                info: data["screen"]["info"].map({
                                                    ($0.1["name"].stringValue, $0.1["data"].stringValue)
                                                }),
                                                downInfo: data["screen"]["downInfo"].map({
                                                    ($0.1["name"].stringValue, $0.1["data"].string)
                                                }),
                                                moreInfo: data["screen"]["moreInfo"].map({
                                                    ($0.0, $0.1["CDI"].stringValue, $0.1["fund"].stringValue)
                                                }))
            
            completion(investmentFund)
        }
    }
    
}
