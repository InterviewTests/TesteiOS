//
//  ShowFundsModels.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import Foundation

enum ShowFunds {
    
  enum Funds {
    
    struct Request {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")!
    }
    
    enum Response {
        case success(data: FundsInfo)
        case error(error: Error)
    } 
    
    class ViewModel {
        var title: String
        var fundName: String
        var whatIs: String
        var definition: String
        var riskTitle: String
        var risk: Int
        var infoTitle: String
        
        var moreInfoFunds: [String] = []
        var moreInfoCDI: [String] = []
        
        var infoNames: [String] = []
        var infoData: [String] = []
        
        var downInfoNames: [String] = []
    
        init(info: FundsInfo) {
            self.title = info.title
            self.fundName = info.fundName
            self.whatIs = info.whatIs
            self.definition = info.definition
            self.riskTitle = info.riskTitle
            self.risk = info.risk
            self.infoTitle = info.infoTitle
            
            [info.moreInfo["month"], info.moreInfo["year"], info.moreInfo["12months"]]
                .forEach { element in
                    self.moreInfoFunds.append("\(String(describing: element!["fund"]!).replacingOccurrences(of: ".", with: ","))%")
                    self.moreInfoCDI.append("\(String(describing: element!["CDI"]!).replacingOccurrences(of: ".", with: ","))%")
                }
            
            info.info
                .forEach { element in
                    self.infoNames.append(element["name"]!)
                    self.infoData.append(element["data"]!)
            }
            
            info.downInfo
                .forEach { element in
                    self.downInfoNames.append(element["name"]! as! String)
            }
        }
    }
  }
    
    struct FundsInfo {
        var title: String
        var fundName: String
        var whatIs: String
        var definition: String
        var riskTitle: String
        var risk: Int
        var infoTitle: String
        
        var moreInfo: [String: [String: Double]]
        
        var info: [[String: String]]
        var downInfo: [[String: Any]]
        
        init(dict: [String: Any]) throws {
            let nestedDict = dict["screen"] as? [String: Any]
            
            if
                let title = nestedDict?["title"] as? String,
                let fundName = nestedDict?["fundName"] as? String,
                let whatIs = nestedDict?["whatIs"] as? String,
                let definition = nestedDict?["definition"] as? String,
                let riskTitle = nestedDict?["riskTitle"] as? String,
                let risk = nestedDict?["risk"] as? Int,
                let infoTitle = nestedDict?["infoTitle"] as? String,
                let moreInfo = nestedDict?["moreInfo"] as? [String: [String: Double]],
                let info = nestedDict?["info"] as? [[String: String]],
                let downInfo = nestedDict?["downInfo"] as? [[String: Any]] {
                
                self.title = title
                self.fundName = fundName
                self.whatIs = whatIs
                self.definition = definition
                self.riskTitle = riskTitle
                self.risk = risk
                self.infoTitle = infoTitle
                self.moreInfo = moreInfo
                self.info = info
                self.downInfo = downInfo
            } else {
                throw FundsError.BadJSONError
            }
        }
    
    }
    
    enum FundsError: Error {
        case BadJSONError
    }
}
