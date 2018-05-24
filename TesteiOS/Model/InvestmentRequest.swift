//
//  InvestmentRequest.swift
//  TesteiOS
//
//  Created by Naville Brasil on 15/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import Foundation

protocol InvestmentRequestDelegate
{
    func getValuesOfInvestments(_ investment: Investment)
}

class InvestmentRequest
{
    let investment = Investment()
    var delegate: InvestmentRequestDelegate?
}

//MARK: - WebServicesDelegate
extension InvestmentRequest: WebServicesDelegate
{
    func getJson(json: [String : AnyObject])
    {
        print(json)
        if let screen = json["screen"] as? NSDictionary
        {
            guard let title = screen["title"] as? String else {return}
            guard let fundName = screen["fundName"] as? String else {return}
            guard let whatIs = screen["whatIs"] as? String else {return}
            guard let definition = screen["definition"] as? String else {return}
            guard let riskTitle = screen["riskTitle"] as? String else {return}
            guard let risk = screen["risk"] as? Int else {return}
            guard let infoTitle = screen["infoTitle"] as? String else {return}
            
            self.investment.title = title
            self.investment.fundName = fundName
            self.investment.whatIs = whatIs
            self.investment.definition = definition
            self.investment.riskTitle = riskTitle
            self.investment.risk = risk
            self.investment.infoTitle = infoTitle
            
            print("title ====>", title)
            print("fundName ====>", fundName)
            print("whatsIs ====>", whatIs)
            print("definition ====>", definition)
            print("riskTitle ====>", riskTitle)
            print("risk ====>", risk)
            print("infoTitle ====>", infoTitle)
            
            if let moreInfo = screen["moreInfo"] as? NSDictionary
            {
                print("moreInfo")
                if let month = moreInfo["month"] as? NSDictionary
                {
                    print("Month")
                    guard let fund = month["fund"] as? Double else {return}
                    guard let cdi = month["CDI"] as? Double else {return}
                    
                    self.investment.monthFund = fund
                    self.investment.monthCdi = cdi
                    print("monthFund ====>", fund)
                    print("monthCdi ====>", cdi)
                }
                
                if let year = moreInfo["year"] as? NSDictionary
                {
                    print("YEAR")
                    guard let fund = year["fund"] as? Double else {return}
                    guard let cdi = year["CDI"] as? Double else {return}
                    
                    self.investment.yearFund = fund
                    self.investment.yearCdi = cdi
                    print("yerFund ====>", fund)
                    print("yerCdi ====>", cdi)
                }
                
                if let months = moreInfo["12months"] as? NSDictionary
                {
                    print("MONTHS")
                    guard let fund = months["fund"] as? Double else {return}
                    guard let cdi = months["CDI"] as? Double else {return}
                    
                    self.investment.monthsFund = fund
                    self.investment.monthsCdi = cdi
                    print("monthsFund ====>", fund)
                    print("monthsCdi ====>", cdi)
                }
            }
            
            if let infos = screen["info"] as? NSArray
            {
                print("infos")
                for eachInfo in infos
                {
                    if let info = eachInfo as? NSDictionary
                    {
                        print("Info do For")
                        guard let name = info["name"] as? String else{return}
                        guard let data = info["data"] as? String else{return}
                        print("infoName ====>", name)
                        print("infoData ====>", data)
                        
                        self.investment.arrayInformations.append(InfoData(name: name, data: data))
                    }
                }
            }
            
            if let downInfos = screen["downInfo"] as? NSArray
            {
                for eachDownInfo in downInfos
                {
                    if let downInfo = eachDownInfo as? NSDictionary
                    {
                        guard let name = downInfo["name"] as? String else {return}
                        let data = downInfo["data"] as? String ?? "Vazio"
                        print("downInfoName ====>", name)
                        print("downInfoData ====>", data)
                        
                        self.investment.arrayDownInfos.append(InfoData(name: name, data: data))
                    }
                }
            }
            self.delegate?.getValuesOfInvestments(self.investment)
        }
    }
    
    func request()
    {
        let ws = WebService(
            function: "fund.json",
            fields: "",
            authUser: "",
            authPassword: "",
            type: "GET",
            token: "")
        
        ws.setUrlServer(urlServer: ServerData.shared.url)
        ws.conect()
        ws.delegate = self
    }
}
