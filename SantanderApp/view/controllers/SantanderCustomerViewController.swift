//
//  SantanderCustomerViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 25/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
import SnapKit
import SwiftValidators

class SantanderCustomerViewController: UIViewController {
    
    @IBOutlet var stSignView: SantanderSignupView!
    
    var cells: Cells?
    var presenter: SantanderPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        SantanderPresenter.sharedManager.fetchedCells(completion: { (cells, error) in
            self.cells = cells
            
            self.startStackFormView()
            self.startCellType()
        })
        
    }
    
    private func startCellType(){
        let data = (self.cells?.data)!
        for cell in data{
            if(cell.type == 4){
                createCheckBox(checkCell: cell)
            }
        }
    }
    
    private func startStackFormView(){
        
        
        let data = (self.cells?.data)!
        for cell in data{
        
            self.createView(formCell: cell)
            
        }
    }
    
    
    @IBAction func didTouchInvestment(_ sender: Any) {
        
        let fundViewController = SantanderRouter.instanceSantanderFundViewController()
        
        self.present(fundViewController, animated: false, completion: nil)
    }
    
}




