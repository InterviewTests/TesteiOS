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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
        default:
            break
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return UITableViewAutomaticDimension
        default:
            return 120.0
        }
    }
}
