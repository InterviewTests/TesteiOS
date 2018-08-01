//
//  FundsFactory.swift
//  TesteIOS
//
//  Created by Sidney Silva on 18/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class FundsFactory: NSObject {
    static func configureCell(fund: Funds, tableView: UITableView, indexPath: IndexPath, delegate: FundsViewController) -> UITableViewCell {
        switch indexPath.section {
        case 1:
            let headerCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.headerCell, for: indexPath) as! HeaderTableViewCell
            headerCell.configureCell(fund: fund)
            return headerCell
        case 2:
            let definitionCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.definitionCell, for: indexPath) as! DefinitionTableViewCell
            definitionCell.configureCell(fund: fund)
            return definitionCell
        case 3:
            let riskTitle = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.riskTitleCell, for: indexPath) as! RiskTitleTableViewCell
            riskTitle.configureCell(fund: fund)
            return riskTitle
        case 4:
            let risk = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.riskCell, for: indexPath) as! RiskTableViewCell
            risk.configureCell(fund: fund)
            return risk
        case 5:
            let infoTitle = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.infoTitleCell, for: indexPath) as! InfoTitleTableViewCell
            infoTitle.configureCell(fund: fund)
            return infoTitle
        case 6:
            let moreInfo = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.moreInfoCell, for: indexPath) as! MoreInfoTableViewCell
            moreInfo.configureCell(fund: fund)
            return moreInfo
        case 7:
            let infoCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.infoCell, for: indexPath) as! InfoTableViewCell
            let info = fund.info[indexPath.row]
            infoCell.configureCell(info: info)
            return infoCell
        case 8:
            let downloadInfo = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.downloadCell, for: indexPath) as! DownInfoTableViewCell
            let download = fund.downInfo[indexPath.row]
            downloadInfo.configureCell(info: download)
            downloadInfo.delegate = delegate
            return downloadInfo
        default:
            let cell = UITableViewCell()
            return cell
        }
        
        let cell = UITableViewCell()
        return cell
    }
    
    static func numberOfRows(section: Int, fund: Funds) -> Int {
        switch section {
        case 7:
            return fund.info.count
        case 8:
            return fund.downInfo.count
        default:
            return 1
        }
    }
}
