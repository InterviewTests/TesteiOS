//
//  FundViewModel.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 28/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import Foundation
import UIKit

enum FundViewModelItemType {
    case fundTitleAndName
    case fundDefinition
    case fundRisk
    case fundMoreInfo
    case fundInfo
    case fundDownInfo
}

protocol FundViewModelItem {
    
    var type: FundViewModelItemType { get }
    var rowCount: Int { get }
    var sectionTitle: String  { get }
}


class FundViewModel: NSObject {
    
    var items = [FundViewModelItem]()
    
    init(data: FundDataModel) {
        super.init()
        
        if let title = data.screen.title, let fundName = data.screen.fundName {
            let titleAndNameItem = FundViewModelTitleAndNameItem(title: title, fundName: fundName)
            items.append(titleAndNameItem)
        }
        if let whatIs = data.screen.whatIs, let definition = data.screen.definition {
            let definitionItem = FundViewModelDefinitionItem(whatIs: whatIs, definition: definition)
            items.append(definitionItem)
        }
        if let riskTitle = data.screen.riskTitle, let risk = data.screen.risk {
            let riskItem = FundViewModelRiskItem(riskTitle: riskTitle, risk: risk)
            items.append(riskItem)
        }
        if let infoTitle = data.screen.infoTitle, let moreInfo = data.screen.moreInfo{
            let moreInfoItem = FundViewModelMoreInfoItem(infoTitle: infoTitle, month:moreInfo.month , year: moreInfo.year, twelveMonths: moreInfo.twelveMonths)
            items.append(moreInfoItem)
        }
        
        let info = data.screen.info
        // we only need info item if infos list is not empty
        if !info.isEmpty {
            let infoItem = FundViewModelInfoItem(fundInfo: info)
            items.append(infoItem)
        }
        
        let downInfo = data.screen.downInfo
        // we only need downInfo item if infos list is not empty
        if !downInfo.isEmpty {
            let downInfoItem = FundViewModelDownInfoItem(fundDownInfo: downInfo)
            items.append(downInfoItem)
        }
    }
    
}


extension FundViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
            case .fundTitleAndName:
                if let cell = tableView.dequeueReusableCell(withIdentifier: FundTitleAndNameTableViewCell.identifier, for: indexPath) as? FundTitleAndNameTableViewCell {
                        cell.item = item
                        return cell
                }
            case .fundDefinition:
                if let cell = tableView.dequeueReusableCell(withIdentifier: FundDefinitionTableViewCell.identifier, for: indexPath) as? FundDefinitionTableViewCell {
                        cell.item = item
                        return cell
                }
            case .fundRisk:
                if let cell = tableView.dequeueReusableCell(withIdentifier: FundRiskTableViewCell.identifier, for: indexPath) as? FundRiskTableViewCell {
                        cell.item = item
                        return cell
                }
            case .fundMoreInfo:
                if let cell = tableView.dequeueReusableCell(withIdentifier: FundMoreInfoTableViewCell.identifier, for: indexPath) as? FundMoreInfoTableViewCell {
                        cell.item = item
                        return cell
                }
            case .fundInfo:
                if let item = item as? FundViewModelInfoItem, let cell = tableView.dequeueReusableCell(withIdentifier: FundInfoTableViewCell.identifier, for: indexPath) as? FundInfoTableViewCell {
                       let info = item.fundInfo[indexPath.row]
                        cell.item = info
                        return cell
                }
            case .fundDownInfo:
                if let item = item as? FundViewModelDownInfoItem, let cell = tableView.dequeueReusableCell(withIdentifier: FundDownInfoTableViewCell.identifier, for: indexPath) as? FundDownInfoTableViewCell {
                        let info = item.fundDownInfo[indexPath.row]
                        cell.item = info
                        return cell
                }
        }
        // return the default cell if none of above succeed
        return UITableViewCell()
    }
}



extension FundViewModelItem {
    var rowCount: Int {
        return 1
    }
}

class FundViewModelTitleAndNameItem: FundViewModelItem {
    var type: FundViewModelItemType {
        return .fundTitleAndName
    }
    var sectionTitle: String {
        return "Main Info"
    }
    
    var title : String
    var fundName : String
    
    init(title: String, fundName: String) {
        self.title = title
        self.fundName = fundName
    }
}

class FundViewModelDefinitionItem: FundViewModelItem {
    var type: FundViewModelItemType {
        return .fundDefinition
    }
    var sectionTitle: String {
        return "Main Info"
    }
    
    var whatIs : String
    var definition : String
    
    init(whatIs: String, definition: String) {
        self.whatIs = whatIs
        self.definition = definition
    }
}

class FundViewModelRiskItem: FundViewModelItem {
    var type: FundViewModelItemType {
        return .fundRisk
    }
    var sectionTitle: String {
        return "Main Info"
    }
    
    var riskTitle : String
    var risk : Int
    
    init(riskTitle: String, risk: Int) {
        self.riskTitle = riskTitle
        self.risk = risk
    }
}


class FundViewModelMoreInfoItem: FundViewModelItem {
    var type: FundViewModelItemType {
        return .fundMoreInfo
    }
    var sectionTitle: String {
        return "Main Info"
    }
    var infoTitle : String
    var month : Revenue
    var year : Revenue
    var twelveMonths : Revenue
    
    init(infoTitle: String, month: Revenue, year: Revenue, twelveMonths:Revenue) {
        
        self.infoTitle = infoTitle
        self.month = month
        self.year = year
        self.twelveMonths = twelveMonths
    }
}


class FundViewModelInfoItem: FundViewModelItem {
    var type: FundViewModelItemType {
        return .fundInfo
    }
    var sectionTitle: String {
        return "Main Info"
    }
    var rowCount: Int {
        return fundInfo.count
    }
    var fundInfo : [Info]
    
    init(fundInfo: [Info]) {
        self.fundInfo = fundInfo
        
    }
}


class FundViewModelDownInfoItem: FundViewModelItem {
    var type: FundViewModelItemType {
        return .fundDownInfo
    }
    var sectionTitle: String {
        return "Main Info"
    }
    var rowCount: Int {
        return fundDownInfo.count
    }
    var fundDownInfo : [Info]
    
    init(fundDownInfo: [Info]) {
        self.fundDownInfo = fundDownInfo
        
    }
}

