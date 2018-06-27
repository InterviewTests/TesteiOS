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


struct InvestmentInfo {
    var name : String = ""
    var data : String = ""
}


class InvestmentViewController: UIViewController {

    let URL = "https://floating-mountain-50292.herokuapp.com/fund.json"
    
    let investment = InvestmentDataModel()
    
    var info = [InvestmentInfo()]

    
    

    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fundNameLabel: UILabel!
    
    @IBOutlet weak var whatIsLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var riskTitleLabel: UILabel!
    
    
    
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    @IBOutlet weak var monthFundLabel: UILabel!
    
    @IBOutlet weak var yearFundLabel: UILabel!
    
    @IBOutlet weak var twelveMonthsFundLabel: UILabel!
    
    @IBOutlet weak var monthCDILabel: UILabel!
    
    @IBOutlet weak var yearCDILabel: UILabel!
    
    @IBOutlet weak var twelveMonthsCDILabel: UILabel!
    
    
    @IBOutlet var infoLabels: [UILabel]!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.contentSize = CGSizeMake(self.view.frame.width, self.view.frame.height+100)

        
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
        
        investment.monthFund = json["screen"]["moreInfo"]["month"]["fund"].floatValue
        investment.monthCDI = json["screen"]["moreInfo"]["month"]["CDI"].floatValue
        investment.yearFund = json["screen"]["moreInfo"]["year"]["fund"].floatValue
        investment.yearCDI = json["screen"]["moreInfo"]["year"]["CDI"].floatValue
        investment.twelveMonthsFund = json["screen"]["moreInfo"]["12months"]["fund"].floatValue
        investment.twelveMonthsFund = json["screen"]["moreInfo"]["12months"]["CDI"].floatValue
        
        var element = InvestmentInfo()
        var size = json["screen"]["info"].count
        
        for item in 0...(size - 1) {
            element.name = json["screen"]["info"][item]["name"].stringValue
            element.data = json["screen"]["info"][item]["data"].stringValue
            
            info.insert(element, at: item)
        }
        info.remove(at: size)
        
        size = json["screen"]["downInfo"].count
        
        for item in 0...(size - 1) {
            element.name = json["screen"]["downInfo"][item]["name"].stringValue
            element.data = json["screen"]["downInfo"][item]["data"].stringValue
            
            info.append(element)
        }
        
        print(info)
        

    
        
        
        
        
        
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
        
        monthFundLabel.text = "\(investment.monthFund)%"
        monthCDILabel.text = "\(investment.monthCDI)%"
        yearFundLabel.text = "\(investment.yearFund)%"
        yearCDILabel.text = "\(investment.yearCDI)%"
        twelveMonthsFundLabel.text = "\(investment.twelveMonthsFund)%"
        twelveMonthsCDILabel.text = "\(investment.twelveMonthsCDI)%"
        
        
        
        var index = 0
        
        for label in infoLabels {
            
            
            
            // if tag is odd
            if (label.tag%2 != 0) {
                print("ímpar: \(label.tag), index: \(index)")
                label.text = info[index].name
                
                
            } else {
                label.text = info[index].data
                print("par: \(label.tag), index: \(index)")
                index = index + 1
            }
        }
        
        
        
      
        
    }
    
    
    
}
