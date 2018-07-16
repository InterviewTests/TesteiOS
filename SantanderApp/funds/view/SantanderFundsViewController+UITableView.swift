//
//  SantanderFundsViewController+UITableView.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 15/07/2018.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import Foundation
import UIKit

extension SantanderFundsViewController: UITableViewDelegate, UITableViewDataSource{
    //MARK: UITableViewDelegate
    //MARK: UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return (self.downInfo.count) + (self.info.count)
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.section{
        case 0:
            let cell: SantanderInvestmentRiskIndicatorCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.santanderInvestmentRiskIndicatorCellTableViewCell.identifier, for: indexPath) as! SantanderInvestmentRiskIndicatorCellTableViewCell
            
            configureCellInvestment(cell: cell)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.moreInfoTableViewCell.identifier) as! MoreInfoTableViewCell
            configureMoreInfoCell(cell: cell, indexPath: indexPath)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: R.reuseIdentifier.santanderFundTableViewCell.identifier, for: indexPath) as! SantanderFundTableViewCell
            configureCell(cell: cell, forRowAt: indexPath)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    func configureMoreInfoCell(cell: MoreInfoTableViewCell, indexPath: IndexPath){
        guard let moreInfo = self.moreInfo else {return}
        self.buildFundStatsView(moreInfoCell: cell, moreInfoMonth: moreInfo, indexPath: indexPath)
    }
    func configureCellInvestment(cell: SantanderInvestmentRiskIndicatorCellTableViewCell){
        
    }
    func configureCell(cell: SantanderFundTableViewCell, forRowAt indexPath: IndexPath) {
        
        if(indexPath.row < (self.info.count)){
            let index = indexPath.row
            if let nameValue = self.info[index].name {
                cell.name.text = nameValue
            }
            if let dataValue = self.info[index].data {
                cell.data.text = dataValue
            }else{
                cell.data.text = "Baixar"
            }
        }else{
            let index = indexPath.row - (self.info.count)
            if let nameValue = self.downInfo[index].name {
                cell.name.text = nameValue
            }
            if let dataValue = self.downInfo[index].data {
                cell.data.text = dataValue
            }else if(indexPath.section == 2){
                cell.data.text = "Baixar"
                
                self.unHideDownloadIcon(cell: cell)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        switch indexPath.section{
        case 0:
            return 100
            
        case 1:
            return 50
            
        case 2:
            return 70
        default:
            return 100
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0{
            return CGFloat(300)
        }
        if section == 1{
            return CGFloat(120)
        }
        
        return CGFloat(0)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2{
            return CGFloat(90)
        }
        return CGFloat(0)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0{
            let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "FundHeaderTableView") as! FundHeaderTableView
            guard let headerInfo = self.headerInfo else { return cell}
            self.buildFundMainView(header: cell, screenInfo: headerInfo)
            return cell
        }
        if section == 1{
            let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "MoreInfoHeaderView") as! MoreInfoHeaderView
            return cell
        }
        return UIView()
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        if section == 2{
            let cell = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: "InvestButtonFooter") as! InvestButtonFooter
            return cell
        }
        
        return UIView()
        
    }
}
