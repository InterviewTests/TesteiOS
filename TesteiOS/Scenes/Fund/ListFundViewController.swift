//
//  ListFundViewController.swift
//  TesteiOS
//
//  Created by Macbook on 10/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import Foundation
import UIKit

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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView.indexPathsForSelectedItems?.first {
            case .some(indexPath):
                return CGSize(width: (self.cvRisk.frame.width / 5) - 2.0, height: 8.0)
            default:
                return CGSize(width: (self.cvRisk.frame.width / 5) - 2.0, height: 5.0)
        }
    }
    
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
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ListFundConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        self.cvRisk.delegate = self
        self.cvRisk.dataSource = self
        
        output.fetchItems()
    }
    
    func successFetchedItems(response: ListFund.Fetch.Response) {
        listFund = response.screen
    }
    
    func errorFetchingItems(response: ListFund.Fetch.Response) {
        
    }
}
