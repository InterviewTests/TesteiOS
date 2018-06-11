//
//  ListFundViewController.swift
//  TesteiOS
//
//  Created by Macbook on 10/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

// Clique botão 'download'
extension ListFundViewController: DownloadTableViewCellDelegate, SFSafariViewControllerDelegate {
    func btnDownloadTapped(_ tag: Int) {
        openSafari()
    }
    
    func openSafari(){
        let safariVC = SFSafariViewController(url: NSURL(string: "https://www.google.com")! as URL)
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}

// Tableview
extension ListFundViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == self.tblMoreInfo {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.tblMoreInfo {
            return 3
        } else {
            if section == 0 {
                return self.listFund.info.count
            } else {
                return self.listFund.downInfo.count
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == self.tblMoreInfo {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell_more_info", for: indexPath) as! MoreInfoTableViewCell
            
            switch indexPath.row {
            case 0:
                cell.lblTitle.text = "No mês"
                cell.lblFund.text = String(listFund.moreInfo.month.fund) + "%"
                cell.lblCdi.text = String(listFund.moreInfo.month.cdi) + "%"
            case 1:
                cell.lblTitle.text = "No ano"
                cell.lblFund.text = String(listFund.moreInfo.year.fund) + "%"
                cell.lblCdi.text = String(listFund.moreInfo.year.cdi) + "%"
            case 2:
                cell.lblTitle.text = "12 meses"
                cell.lblFund.text = String(listFund.moreInfo.the12Months.fund) + "%"
                cell.lblCdi.text = String(listFund.moreInfo.the12Months.cdi) + "%"
            default:
                cell.lblTitle.text = "No mês"
                cell.lblFund.text = String(listFund.moreInfo.month.fund) + "%"
                cell.lblCdi.text = String(listFund.moreInfo.month.cdi) + "%"
            }
            
            return cell
        } else {
            if indexPath.section == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell_info", for: indexPath) as! InfoTableViewCell
                
                let item = listFund.info[indexPath.row]
                
                cell.lblName.text = item.name
                cell.lblData.text = item.data
                
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "cell_download", for: indexPath) as! DownloadTableViewCell
                
                let item = listFund.downInfo[indexPath.row]
                
                cell.lblTitle.text = item.name
                cell.downloadTableViewCellDelegate = self
                
                return cell
            }
        }
    } 
}

// Collectionview
extension ListFundViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell_risk", for: indexPath)
        
        // Alterar cor da celula de acordo com o risco
        switch indexPath.row {
        case 0:
            cell.backgroundColor = UIColor(red:0.45, green:0.85, blue:0.38, alpha:1.0)
        case 1:
            cell.backgroundColor = UIColor(red:0.29, green:0.76, blue:0.42, alpha:1.0)
        case 2:
            cell.backgroundColor = UIColor(red:1.00, green:0.75, blue:0.07, alpha:1.0)
        case 3:
            cell.backgroundColor = UIColor(red:1.00, green:0.45, blue:0.17, alpha:1.0)
        case 4:
            cell.backgroundColor = UIColor(red:1.00, green:0.21, blue:0.20, alpha:1.0)
        default:
            cell.backgroundColor = UIColor(red:0.45, green:0.85, blue:0.38, alpha:1.0)
        }
        
        return cell
    }
    
    // Alterar altura caso a cell esteja selecionada
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.indexPathsForSelectedItems?.first {
            case .some(indexPath):
                return CGSize(width: (self.cvRisk.frame.width / 5) - 2.0, height: 10.0)
            default:
                return CGSize(width: (self.cvRisk.frame.width / 5) - 2.0, height: 5.0)
        }
    }
    
    // Efetuar update na collectionVie
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.performBatchUpdates({
            
        }) { (error) in
            
        }
    }
}

protocol ListFundViewControllerInput
{
    
}

protocol ListFundViewControllerOutput
{
    func fetchItems()
}

class ListFundViewController : UIViewController, ListFundViewControllerInput {
    var output: ListFundViewControllerOutput!
    var router: ListFundRouter!
    
    // Lista de itens
    var listFund : Screen!
    
    @IBOutlet weak var cvRisk: UICollectionView!
    @IBOutlet weak var tblMoreInfo: UITableView!
    @IBOutlet weak var tblInfo: UITableView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ListFundConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.cvRisk.delegate = self
        self.cvRisk.dataSource = self
        
        self.tblMoreInfo.delegate = self
        self.tblInfo.delegate = self
        
        output.fetchItems()
    }
    
    func successFetchedItems(response: ListFund.Fetch.Response) {
        listFund = response.screen
        
        self.tblInfo.dataSource = self
        self.tblMoreInfo.dataSource = self
        
        tblMoreInfo.reloadData()
        tblInfo.reloadData()
        
        cvRisk.reloadData()
        // Selecionar nivel de risco
        let idxRisk = IndexPath(row: listFund.risk - 1, section: 0)
        self.cvRisk.selectItem(at: idxRisk, animated: true, scrollPosition: .centeredVertically)
    }
    
    func errorFetchingItems(response: ListFund.Fetch.Response) {
        
    }
}
