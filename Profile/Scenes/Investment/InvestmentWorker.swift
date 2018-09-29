//
//  InvestmentWorker.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import Foundation
import Alamofire

class InvestmentWorker {
    
    func getInvestmentData (callback: @escaping (ShowInvestment.GetInvestment.ViewModel.DisplayedInvestment?) -> Void) {
        
        let url = "https://floating-mountain-50292.herokuapp.com/fund.json"
        
        Alamofire.request(url).validate(statusCode: 200..<300).responseJSON { (response) in
            
            if let json = response.result.value as? Dictionary<String,AnyObject> {
                
                if let responseChild = json["screen"] as? Dictionary<String,AnyObject> {
                 
                    let investmentData = self.handle(response: responseChild)
                    callback(investmentData)
                }
            }
        }
    }
    
    private func handle(response: Dictionary<String,AnyObject>?) -> ShowInvestment.GetInvestment.ViewModel.DisplayedInvestment? {
        
        guard let moreInfo = response?["moreInfo"] as? Dictionary<String,AnyObject>
            else {return nil}
        
        guard let month = moreInfo["month"] as? Dictionary<String,AnyObject>
            else {return nil}
        
        guard let year = moreInfo["year"] as? Dictionary<String,AnyObject>
            else {return nil}
        
        guard let accumulated = moreInfo["12months"] as? Dictionary<String,AnyObject>
            else {return nil}
        
        guard let info = response?["info"] as? [Dictionary<String,AnyObject>]
            else {return nil}
        
        guard let downInfo = response?["downInfo"] as? [Dictionary<String,AnyObject>]
            else {return nil}
        
        var investmentInfo: [String] = []
        var downloadInfo: [String] = []
        
        for dictionary in info {
            
            if let name = dictionary["name"] as? String { investmentInfo.append(name)}
            if let data = dictionary["data"] as? String {investmentInfo.append(data)}
        }
        
        for dictionary in downInfo {
            
            if let name = dictionary["name"] as? String { downloadInfo.append(name)}
            if let data = dictionary["data"] as? String {downloadInfo.append(data)}
        }
        
        var risk = ""
        if let temp = response?["risk"] as? Int {
            risk = String(temp)
        }

        let investmentData = ShowInvestment.GetInvestment.ViewModel.DisplayedInvestment(
            screenTitle: response?["title"] as! String,
            investmentFundName: response?["fundName"] as! String,
            whatIs: response?["whatIs"] as! String,
            definition: response?["definition"] as! String,
            riskTitle: response?["riskTitle"] as! String,
            risk: risk,
            infoTitle: response?["infoTitle"] as! String,
            monthlyFundValue: month["fund"] as! Double,
            monthlyCDIValue: month["CDI"] as! Double,
            yearFundValue: year["fund"] as! Double,
            yearCDIValue: year["CDI"] as! Double,
            accumulatedFundValue: accumulated["fund"] as! Double,
            accumulatedCDIValue: accumulated["CDI"] as! Double,
            investmentInfo : investmentInfo,
            downloadInfo : downloadInfo
        )
        
        return investmentData
    }
}
