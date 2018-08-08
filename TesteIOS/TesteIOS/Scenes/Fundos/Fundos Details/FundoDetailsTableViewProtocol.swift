//
//  FundoDetailsTableViewProtocol.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

extension FundosDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        guard let fundo = displayedFundo else {
            return 0
        }
        
        let infoCount = fundo.info.count
        let downInfoCount = fundo.downInfo.count
        
        let totalCells = CGFloat(infoCount + downInfoCount)
        
        infoTableViewHeight.constant = cellHeight * totalCells
        
        switch section {
        case 0:
            return infoCount
        
        case 1:
            return downInfoCount
            
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let fundo = displayedFundo else {
            return UITableViewCell()
        }
        
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InfoCell", for: indexPath) as! FundosDetailsDefaultCell
            cell.setInfo(info: fundo.info[indexPath.row])
            cell.delegate = self
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "DownInfoCell", for: indexPath) as! FundosDetailsDefaultCell
            cell.setInfo(info: fundo.downInfo[indexPath.row])
            cell.delegate = self
            return cell
            
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return cellHeight
    }
}
