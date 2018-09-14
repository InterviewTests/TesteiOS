//
//  FundsViewController.swift
//  Investimentos
//
//  Created by Cmdev on 13/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

class FundsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var screen = Screen()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        FundsAPI.getFundsInfo { (screen, success) in
            if success {
                guard let screenInfos = screen else { return }
                self.screen = screenInfos
                self.tableView.reloadData()
            }
        }
        
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


extension FundsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 3
        case 2:
            return screen.info.count
        case 3:
            return screen.downInfo.count
        case 4:
            return 1
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.FundInfoCell, for: indexPath) as? FundInfoTableViewCell
                cell?.titleLabel.text = screen.title
                cell?.fundNameLabel.text = screen.fundName
                cell?.whatIsLabel.text = screen.whatIs
                cell?.definitionTextView.text = screen.definition
                return cell!
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.DegreeRiskCell, for: indexPath) as? RiskTableViewCell
                cell?.riskDegreeLabel.text = screen.riskTitle
                return cell!
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.InfoTitleCell, for: indexPath) as? InfoTitleTableViewCell
                cell?.infoTitleLabel.text = screen.infoTitle
                return cell!
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.MoreInfoCell, for: indexPath) as? MoreInfoTableViewCell
                cell?.descLabel.text = "No mês"
                cell?.cdiLabel.text = screen.moreInfo?.month?.CDI?.doubleValue.getPercentageStringValue()
                cell?.fundLabel.text = screen.moreInfo?.month?.fund?.doubleValue.getPercentageStringValue()
                return cell!
            case 1:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.MoreInfoCell, for: indexPath) as? MoreInfoTableViewCell
                cell?.descLabel.text = "No ano"
                cell?.cdiLabel.text = screen.moreInfo?.year?.CDI?.doubleValue.getPercentageStringValue()
                cell?.fundLabel.text = screen.moreInfo?.year?.fund?.doubleValue.getPercentageStringValue()
                return cell!
            case 2:
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.MoreInfoCell, for: indexPath) as? MoreInfoTableViewCell
                cell?.descLabel.text = "12 meses"
                cell?.cdiLabel.text = screen.moreInfo?._12months?.CDI?.doubleValue.getPercentageStringValue()
                cell?.fundLabel.text = screen.moreInfo?._12months?.fund?.doubleValue.getPercentageStringValue()
                return cell!
            default: break
            }
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.InfoCell, for: indexPath) as? InfoTableViewCell
            cell?.descLabel.text = screen.info[indexPath.row].name
            cell?.valueLabel.text = screen.info[indexPath.row].data
            return cell!
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.DownInfoCell, for: indexPath) as? DownInfoTableViewCell
            cell?.descLabel.text = screen.downInfo[indexPath.row].name
            return cell!
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.InvestButtonCell, for: indexPath)
            return cell
        default:
            break
        }

        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                return UITableViewAutomaticDimension
            case 1:
                return 120.0
            default:
                return 44.0
            }
        case 1, 2, 3:
            return 40.0
        case 4:
            return 55.0
        default:
            break
        }
        return 0.0
    }
}
