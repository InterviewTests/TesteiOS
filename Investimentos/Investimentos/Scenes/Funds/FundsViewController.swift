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
        
        //altura da primeira célula é definida dinamicamente
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension FundsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1:
            return 3
        case 2:
            return 1
        case 3:
            return screen.info.count
        case 4:
            return screen.downInfo.count
        case 5:
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
                //célula de informações gerais
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.FundInfoCell, for: indexPath) as? FundInfoTableViewCell
                cell?.titleLabel.text = screen.title
                cell?.fundNameLabel.text = screen.fundName
                cell?.whatIsLabel.text = screen.whatIs
                cell?.definitionTextView.text = screen.definition
                return cell!
            case 1:
                //célula de riscos de investimentos
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.DegreeRiskCell, for: indexPath) as? RiskTableViewCell
                cell?.riskDegreeLabel.text = screen.riskTitle
                cell?.selectRisk(risk: screen.risk?.intValue ?? 3)
                return cell!
            case 2:
                //título sobre investimentos
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.InfoTitleCell, for: indexPath) as? InfoTitleTableViewCell
                cell?.infoTitleLabel.text = screen.infoTitle
                return cell!
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                //informações do investimento: mês
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.MoreInfoCell, for: indexPath) as? MoreInfoTableViewCell
                cell?.descLabel.text = "No mês"
                cell?.cdiLabel.text = screen.moreInfo?.month?.CDI?.doubleValue.getPercentageStringValue()
                cell?.fundLabel.text = screen.moreInfo?.month?.fund?.doubleValue.getPercentageStringValue()
                return cell!
            case 1:
                //informações do investimento: ano
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.MoreInfoCell, for: indexPath) as? MoreInfoTableViewCell
                cell?.descLabel.text = "No ano"
                cell?.cdiLabel.text = screen.moreInfo?.year?.CDI?.doubleValue.getPercentageStringValue()
                cell?.fundLabel.text = screen.moreInfo?.year?.fund?.doubleValue.getPercentageStringValue()
                return cell!
            case 2:
                //informações do investimento: 12 meses
                let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.MoreInfoCell, for: indexPath) as? MoreInfoTableViewCell
                cell?.descLabel.text = "12 meses"
                cell?.cdiLabel.text = screen.moreInfo?._12months?.CDI?.doubleValue.getPercentageStringValue()
                cell?.fundLabel.text = screen.moreInfo?._12months?.fund?.doubleValue.getPercentageStringValue()
                return cell!
            default: break
            }
        case 2:
            //célula separador
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.SeparatorCell, for: indexPath)
            return cell
        case 3:
            //informações do investimento
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.InfoCell, for: indexPath) as? InfoTableViewCell
            cell?.descLabel.text = screen.info[indexPath.row].name
            cell?.valueLabel.text = screen.info[indexPath.row].data
            return cell!
        case 4:
            //informações para download
            let cell = tableView.dequeueReusableCell(withIdentifier: CellNamespace.DownInfoCell, for: indexPath) as? DownInfoTableViewCell
            cell?.descLabel.text = screen.downInfo[indexPath.row].name
            return cell!
        case 5:
            //botão Investir
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
                //primeira céula com altura dinâmica
                return UITableViewAutomaticDimension
            case 1:
                return 120.0
            default:
                return 44.0
            }
        case 2:
            return 20.0
        case 1, 3, 4:
            return 40.0
        case 5:
            return 95.0
        default:
            break
        }
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 40.0 : 0.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
            let header = tableView.dequeueReusableCell(withIdentifier: "MORE_INFO_HEADER") as? MoreInfoHeaderTableViewCell
            header?.cdiTitleLabel.text = "CDI"
            header?.fundTitleLabel.text = "Fundos"
            return header
        }
        return nil
    }
}
