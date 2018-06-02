//
//  FundViewController.swift
//  IOSApp
//
//  Created by Ana Beatriz Delavia Thomasi on 27/05/2018.
//  Copyright © 2018 Ana Beatriz Delavia Thomasi. All rights reserved.
//

import UIKit

class FundViewController: UIViewController, UITableViewDataSource {
    final let fundURL = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")
    var screen : FundDataModel? = nil
    
    @IBOutlet weak var fundTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fundTableView.separatorStyle = UITableViewCellSeparatorStyle.none
        downloadJson { (screen) in
            self.screen = screen
            DispatchQueue.main.async {
                self.fundTableView.reloadData()
            }
        }
    }

    
    func downloadJson(onComplete: @escaping (FundDataModel) -> Void) {
        guard let downloadURL = fundURL else {return}
        URLSession.shared.dataTask(with: downloadURL) {data, urlResponse, error in
            if error == nil {
                guard let urlResponse = urlResponse as? HTTPURLResponse else {return}
                if urlResponse.statusCode == 200 {
                    guard let data = data else {return}
                    
                    do {
                        let decoder = JSONDecoder()
                        let downloadedScreen = try decoder.decode(FundDataModel.self, from: data)
                        onComplete(downloadedScreen)
                    } catch{
                        print("something wrong after downloading")
                    }
                } else {return}
            } else {return}
            }.resume()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (screen == nil){
            return 8
        } else {
            return 8 + (screen?.screen.info.count)! + (screen?.screen.downInfo.count)! + 1
        }
        
        }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        if (indexPath.row == 0) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "TitleTableViewCell") as? TitleTableViewCell else {return
                UITableViewCell()}
            
            
            
            cell.fundTitleLbl.text = screen?.screen.title
            cell.fundNameLbl.text = screen?.screen.fundName
            return cell
        }
            
        else if (indexPath.row == 1) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "WhatIsTableViewCell") as? WhatIsTableViewCell else {return
                UITableViewCell()}
            
            
            
            cell.whatIsLbl.text = screen?.screen.whatIs
            cell.definitionLbl.text = screen?.screen.definition
            return cell
        }
        else if (indexPath.row == 2) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "RiskTableViewCell") as? RiskTableViewCell else {return
                UITableViewCell()}
            
            
            cell.riskTitleLbl.text = screen?.screen.riskTitle
            
            if (screen?.screen.risk == 1){
                
                cell.risk1Img.image = #imageLiteral(resourceName: "arrow_risk1")
                
            } else if (screen?.screen.risk == 2){
                
                cell.risk2Img.image = #imageLiteral(resourceName: "arrow_risk2")
                
            } else if (screen?.screen.risk == 3){
                
                cell.risk3Img.image = #imageLiteral(resourceName: "arrow_risk3")
                
            } else if (screen?.screen.risk == 4){
                
                cell.risk4Img.image = #imageLiteral(resourceName: "arrow_risk4")
                
            } else if (screen?.screen.risk == 5){
                
                cell.risk5Img.image = #imageLiteral(resourceName: "arrow_risk5")
                
            }
          
            return cell
        }
        else if (indexPath.row == 3) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoHeaderTableViewCell") as? InfoHeaderTableViewCell else {return
                UITableViewCell()}
            
            
            cell.infoTitleLbl.text = screen?.screen.infoTitle
            cell.fundLbl.text = "Fundo"
            cell.cdiLbl.text = "CDI"
            
            return cell
        }
        else if (indexPath.row == 4) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreInfoTableViewCell") as? MoreInfoTableViewCell else {return
                UITableViewCell()}
            
            
            cell.MoreInfoLbl.text = "No mês"
            cell.MIFundLbl.text = screen?.screen.moreInfo?.month.fund
            cell.MIcdiLbl.text = screen?.screen.moreInfo?.month.cdi
            
            return cell
        }
        else if (indexPath.row == 5) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreInfoTableViewCell") as? MoreInfoTableViewCell else {return
                UITableViewCell()}
            
            
            cell.MoreInfoLbl.text = "No ano"
            cell.MIFundLbl.text = screen?.screen.moreInfo?.year.fund
            cell.MIcdiLbl.text = screen?.screen.moreInfo?.year.cdi
            
            return cell
        }
            
        else if (indexPath.row == 6) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "MoreInfoTableViewCell") as? MoreInfoTableViewCell else {return
                UITableViewCell()}
            
            
            cell.MoreInfoLbl.text = "12 meses"
            cell.MIFundLbl.text = screen?.screen.moreInfo?.twelveMonths.fund
            cell.MIcdiLbl.text = screen?.screen.moreInfo?.twelveMonths.cdi
            
            return cell
        
        }
        else if (indexPath.row == 7) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "LineTwoTableViewCell") as? LineTwoTableViewCell else {return
                UITableViewCell()}
            
            return cell
            
        }
        
        else if (indexPath.row >= 8 && screen != nil && indexPath.row < 8 + (screen?.screen.info.count)!) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoTableViewCell") as? InfoTableViewCell else {return
                UITableViewCell()}
            
            
            cell.nameLbl.text = screen?.screen.info[indexPath.row-8].name
            cell.dataLbl.text = screen?.screen.info[indexPath.row-8].data
            
            return cell
        }
        else if (screen != nil && indexPath.row >= 8 + (screen?.screen.info.count)! && indexPath.row < 8 + (screen?.screen.info.count)! + (screen?.screen.downInfo.count)!) {
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DownInfoTableViewCell") as? DownInfoTableViewCell else {return
                UITableViewCell()}
            
            cell.DINameLbl.text = screen?.screen.downInfo[indexPath.row - (8
                + (screen?.screen.info.count)!)].name
            
            return cell
        }
        else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "InvstBtnTableViewCell") as? InvstBtnTableViewCell else {return
                UITableViewCell()}
            return cell
        }
    }
}
