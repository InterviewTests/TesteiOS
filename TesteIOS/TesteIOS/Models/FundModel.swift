//
//  FundModel.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 03/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundModel {
    var title: String! { get }
    var fundName: String! { get }
    var whatIs: String! { get }
    var definition: String! { get }
    var riskTitle: String! { get }
    var risk: Int! { get }
    var infoTitle: String! { get }
    
    //Info
    var moreInfo: FundMoreInfoModel! { get }
    var info: [FundInfoModel]! { get }
    var downInfo: [FundInfoModel]! { get }
}

struct FundModelFields: FundModel {
    let title: String!
    let fundName: String!
    let whatIs: String!
    let definition: String!
    let riskTitle: String!
    let risk: Int!
    let infoTitle: String!
    
    //Info
    let moreInfo: FundMoreInfoModel!
    let info: [FundInfoModel]!
    let downInfo: [FundInfoModel]!
    
    init(json: JSONDict){
        title = json["title"] as? String ?? ""
        fundName = json["fundName"] as? String ?? ""
        whatIs = json["whatIs"] as? String ?? ""
        definition = json["definition"] as? String ?? ""
        riskTitle = json["riskTitle"] as? String ?? ""
        risk = json["risk"] as? Int ?? 0
        infoTitle = json["infoTitle"] as? String ?? ""
        
        let moreInfoJson = json["moreInfo"] as? JSONDict ?? [:]
        moreInfo = FundMoreInfoModelFields(json: moreInfoJson)
        
        var info: [FundInfoModel] = []
        if let infoJsonArray = json["info"] as? [JSONDict] {
            for infoJson in infoJsonArray {
                info.append(FundInfoModelFields(json: infoJson))
            }
        }
        self.info = info
        
        var downInfo: [FundInfoModel] = []
        if let downInfoJsonArray = json["downInfo"] as? [JSONDict] {
            for downInfoJson in downInfoJsonArray {
                downInfo.append(FundInfoModelFields(json: downInfoJson))
            }
        }
        self.downInfo = downInfo
    }
}
