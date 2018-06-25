//
//  InvestmentViewController.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 6/21/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class InvestmentViewController: UIViewController {

    let URL = "https://floating-mountain-50292.herokuapp.com/fund.json"
    
    let investment = InvestmentDataModel()
    

    
    

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fundNameLabel: UILabel!
    
    @IBOutlet weak var whatIsLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var riskTitleLabel: UILabel!
    
    
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(url: URL)
    }
    
    
    //MARK: - Networking
    /*********************************************************************/
    func getData(url: String) {
        
        // retrieve data from an HTTP request
        Alamofire.request(url, method: .get).responseJSON {
            // once the response comes back
            response in
            if response.result.isSuccess {
                let dataJSON : JSON = JSON(response.result.value!)
                self.updateData(using: dataJSON)
            }
                // if it did not manage to get the data
            else {
                print("Error: \(response.result.error!)")
            }
        }
    }
    
    
    //MARK: - JSON parsing
    /*********************************************************************/
    func updateData(using json: JSON) {
        
        investment.title = json["screen"]["title"].stringValue
        investment.fundName = json["screen"]["fundName"].stringValue
        investment.whatIsLabel = json["screen"]["whatIs"].stringValue
        investment.definition = json["screen"]["definition"].stringValue
        investment.riskTitle = json["screen"]["riskTitle"].stringValue
        investment.risk = json["screen"]["risk"].intValue
        investment.infoTitle = json["screen"]["infoTitle"].stringValue
        
        updateUIWithData()
        
    }
    
    
    //MARK: - UI Updates
    /*********************************************************************/
    func updateUIWithData() {
        
        titleLabel.text = investment.title
        fundNameLabel.text = investment.fundName
        whatIsLabel.text = investment.whatIsLabel
        definitionLabel.adjustsFontSizeToFitWidth = true
        definitionLabel.text = investment.definition
        riskTitleLabel.text = investment.riskTitle
        infoTitleLabel.text = investment.infoTitle
        
    }
    
    
    
}
