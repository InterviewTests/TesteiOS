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
import SafariServices


class InvestmentViewController: UIViewController, SFSafariViewControllerDelegate {

    // URL constants
    let URL = "https://floating-mountain-50292.herokuapp.com/fund.json"
    let googleURL = "https://www.google.com"
    
    // variables to handle Json data
    var fund = Fund()
    
    // outlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var fundNameLabel: UILabel!
    
    @IBOutlet weak var whatIsLabel: UILabel!
    
    @IBOutlet weak var definitionLabel: UILabel!
    
    @IBOutlet weak var riskTitleLabel: UILabel!
    
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    @IBOutlet var moreInfoLabels: [UILabel]!
    
    @IBOutlet var infoLabels: [UILabel]!
    
    @IBOutlet weak var bar: SegmentedProgressBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getData(url: URL)
    }
    
    
    @IBAction func downloadButtonPressed(_ sender: Any) {
        
        let safariVC = SFSafariViewController(url: NSURL(string: googleURL)! as URL)
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
    
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
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
        
        // draw segmented line according to risk
        bar.drawSegments(highlight: json["screen"]["risk"].intValue)
        
        fund.title = json["screen"]["title"].stringValue
        fund.fundName = json["screen"]["fundName"].stringValue
        fund.whatIs = json["screen"]["whatIs"].stringValue
        fund.definition = json["screen"]["definition"].stringValue
        fund.riskTitle = json["screen"]["riskTitle"].stringValue
        fund.risk = json["screen"]["risk"].intValue
        fund.infoTitle = json["screen"]["infoTitle"].stringValue
        
        // moreInfo parsing
        var mi = MoreInfo()
        
        mi.fund = json["screen"]["moreInfo"]["month"]["fund"].floatValue
        mi.CDI = json["screen"]["moreInfo"]["month"]["CDI"].floatValue
        fund.moreInfo.append(mi)
        
        mi.fund = json["screen"]["moreInfo"]["year"]["fund"].floatValue
        mi.CDI = json["screen"]["moreInfo"]["year"]["CDI"].floatValue
        fund.moreInfo.append(mi)
        
        mi.fund = json["screen"]["moreInfo"]["12months"]["fund"].floatValue
        mi.CDI = json["screen"]["moreInfo"]["12months"]["CDI"].floatValue
        fund.moreInfo.append(mi)
        
        // info parsing
        var inf = Info()
        var size = json["screen"]["info"].count
        
        for item in 0..<size {
            inf.name = json["screen"]["info"][item]["name"].stringValue
            inf.data = json["screen"]["info"][item]["data"].stringValue
            
            fund.info.append(inf)
        }
        
        // downInfo parsing
        var di = Info()
        size = json["screen"]["downInfo"].count
        
        for item in 0..<size {
            di.name = json["screen"]["downInfo"][item]["name"].stringValue
            di.data = json["screen"]["downInfo"][item]["data"].stringValue
            
            fund.downInfo.append(di)
        }
        
        updateUIWithData()
        
    }
    
    
    //MARK: - UI Updates
    /*********************************************************************/
    func updateUIWithData() {
        
        titleLabel.text = fund.title
        fundNameLabel.text = fund.fundName
        whatIsLabel.text = fund.whatIs
        
        definitionLabel.adjustsFontSizeToFitWidth = true
        definitionLabel.text = fund.definition
        
        riskTitleLabel.text = fund.riskTitle
        infoTitleLabel.text = fund.infoTitle
        
        // more Info labels tags fund: even, CDI: odd
        moreInfoLabels[0].text = formatNumber(number: fund.moreInfo[0].fund)
        moreInfoLabels[1].text = formatNumber(number: fund.moreInfo[0].CDI)
        moreInfoLabels[2].text = formatNumber(number: fund.moreInfo[1].fund)
        moreInfoLabels[3].text = formatNumber(number: fund.moreInfo[1].CDI)
        moreInfoLabels[4].text = formatNumber(number: fund.moreInfo[2].fund)
        moreInfoLabels[5].text = formatNumber(number: fund.moreInfo[2].CDI)
        
        // info labels tags data: even, name: odd
        infoLabels[0].text = fund.info[0].name
        infoLabels[1].text = fund.info[0].data
        
        infoLabels[2].text = fund.info[1].name
        infoLabels[3].text = fund.info[1].data
        
        infoLabels[4].text = fund.info[2].name
        infoLabels[5].text = fund.info[2].data
        
        infoLabels[6].text = fund.info[3].name
        infoLabels[7].text = fund.info[3].data
        
        infoLabels[8].text = fund.info[4].name
        infoLabels[9].text = fund.info[4].data
        
        infoLabels[10].text = fund.info[5].name
        infoLabels[11].text = fund.info[5].data
        
        infoLabels[12].text = fund.info[6].name
        infoLabels[13].text = fund.info[6].data
        
        // down info
        infoLabels[14].text = fund.downInfo[0].name
        infoLabels[15].text = fund.downInfo[1].name
        infoLabels[16].text = fund.downInfo[2].name
        infoLabels[17].text = fund.downInfo[3].name
        infoLabels[18].text = fund.downInfo[4].name
    }
    
    
    
    func formatNumber (number : Float) -> String {
        // adapt to BRL currency
        let formatter = NumberFormatter()
        formatter.locale = Locale.init(identifier: "pt_BR")
        formatter.numberStyle = .decimal
        
        let formattedTotalValue = formatter.string(from: number as NSNumber)
        return "\(formattedTotalValue!)%"
    }
    
}
