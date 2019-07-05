//
//  InvestmentViewController.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 03/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import UIKit

class InvestmentViewController: UIViewController {

    let manager = InvestmentManager()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
        manager.getData {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.navigationItem.title = "Investimento"
        let shareButton = UIBarButtonItem(image: #imageLiteral(resourceName: "share"), style: .done, target: self, action: #selector(share))
        shareButton.tintColor = .red
        tabBarController?.navigationItem.rightBarButtonItem = shareButton
    }
    
    @objc func share() {
        "Data to share".share()
    }
    

    /*
    // MARK: - NavigationO Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos.

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension InvestmentViewController: UITabBarDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 9
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0, 1, 2, 3, 4, 8: return manager.screenInfo != nil ? 1 : 0
        case 5: return 3
        case 6: return manager.screenInfo?.info.count ?? 0
        default: return manager.screenInfo?.downInfo.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        print("Here")
        switch indexPath.section {
        case 0: return 115
        case 1: return 110
        case 2: return 120
        default: return 50
        }
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        // Swift 4.2 onwards
//        return UITableView.automaticDimension
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "headerCell") as! headerTableViewCell
            guard let screenInfo = manager.screenInfo else { return cell }
            cell.prepare(screenInfo: screenInfo)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "whatIsCell", for: indexPath) as! whatIsTableViewCell
            guard let screenInfo = manager.screenInfo else { return cell }
            cell.prepare(screenInfo: screenInfo)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "riskCell", for: indexPath) as! riskTableViewCell
            guard let screenInfo = manager.screenInfo else { return cell }
            cell.prepare(screenInfo: screenInfo)
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "infoCell", for: indexPath) as! infoTableViewCell
            guard let screenInfo = manager.screenInfo else { return cell }
            cell.prepare(screenInfo: screenInfo)
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "fdcCell", for: indexPath) as! fcdTableViewCell
            return cell
        case 5:
            let cell = tableView.dequeueReusableCell(withIdentifier: "monthCell", for: indexPath) as! mounthTableViewCell
            guard let screenInfo = manager.screenInfo else { return cell }
            cell.prepare(screenInfo: screenInfo, index: indexPath.row)
            return cell
        case 6:
            let cell = tableView.dequeueReusableCell(withIdentifier: "dCell", for: indexPath) as! dTableViewCell
            guard let screenInfo = manager.screenInfo else { return cell }
            cell.prepare(info: screenInfo.info[indexPath.row])
            return cell
        case 7:
            let cell = tableView.dequeueReusableCell(withIdentifier: "downloadCell", for: indexPath) as! downloadTableViewCell
            guard let screenInfo = manager.screenInfo else { return cell }
            cell.prepare(downInfo: screenInfo.downInfo[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! investingTableViewCell
            cell.sendButton.addTarget(self, action: #selector(investing), for: .touchUpInside)
            return cell
        }
    }
    
    @objc func investing() {
        let alert = UIAlertController(title: "Sucesso!", message: "Investimento realizado com sucesso!", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alert.view.tintColor = .black
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}
