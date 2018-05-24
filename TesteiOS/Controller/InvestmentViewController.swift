//
//  InvestmentViewController.swift
//  TesteiOS
//
//  Created by Naville Brasil on 15/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit

class InvestmentViewController: UIViewController
{
    //Outlets
    @IBOutlet weak var labelInvestment: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelFundName: UILabel!
    @IBOutlet weak var labelWhatIs: UILabel!
    @IBOutlet weak var labelDefinition: UILabel!
    @IBOutlet weak var labelRiskTitle: UILabel!
    //
    @IBOutlet weak var stackRisk: UIStackView!
    //
    @IBOutlet weak var imageArrowGreen: UIImageView!
    @IBOutlet weak var imageArrowDarkGreen: UIImageView!
    @IBOutlet weak var imageArrowYellow: UIImageView!
    @IBOutlet weak var imageArrowOrange: UIImageView!
    @IBOutlet weak var imageArrowRed: UIImageView!
    //
    @IBOutlet weak var heightViewGreen: NSLayoutConstraint!
    @IBOutlet weak var heightViewDarkGreen: NSLayoutConstraint!
    @IBOutlet weak var heightViewYellow: NSLayoutConstraint!
    @IBOutlet weak var heightViewOrange: NSLayoutConstraint!
    @IBOutlet weak var heightViewRed: NSLayoutConstraint!
    @IBOutlet weak var heigthStack: NSLayoutConstraint!
    
    //
    @IBOutlet weak var labelInfoTitle: UILabel!
    //
    @IBOutlet weak var labelMonthCDI: UILabel!
    @IBOutlet weak var labelMonthFund: UILabel!
    @IBOutlet weak var labelYearCDI: UILabel!
    @IBOutlet weak var labelYearFund: UILabel!
    @IBOutlet weak var label12MonthsCDI: UILabel!
    @IBOutlet weak var label12MonthsFund: UILabel!
    //
    @IBOutlet weak var labelAdministrationFee: UILabel!
    @IBOutlet weak var labelAdministrationsData: UILabel!
    //
    @IBOutlet weak var labelEssential: UILabel!
    @IBOutlet weak var labelPerformance: UILabel!
    @IBOutlet weak var labelComplamentary: UILabel!
    @IBOutlet weak var labelRegulation: UILabel!
    @IBOutlet weak var labelMembership: UILabel!
    //
    
    //Properties
    //Instance of InvestmentRequest
    var investmentRequest = InvestmentRequest()
    
    //MARK: - Methods
    override func viewDidLoad()
    {
        super.viewDidLoad()

        ActivityIndicator.startActivity()
        
        //Calling method
        self.investmentRequest.request()
        self.investmentRequest.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "webViewSegue"
        {
            //Pass url for other controller
            let vc = segue.destination as! WebViewController
            vc.pageUrl = "https://www.google.com.br"
        }
    }
    
    //MARK: - My Methods
    //Method that show the level of risk
    func pointInvestmentRisk(_ risck: Int)
    {
        switch risck
        {
            case 1:
                hideArror(true)
                self.imageArrowGreen.isHidden = false
            case 2:
                hideArror(true)
                self.imageArrowDarkGreen.isHidden = false
            case 3:
                hideArror(true)
                self.imageArrowYellow.isHidden = false
            case 4:
                hideArror(true)
                self.imageArrowOrange.isHidden = false
            default:
                hideArror(true)
                self.imageArrowRed.isHidden = false
        }
        
        view.layoutIfNeeded()
    }
    
    //Hide images
    func hideArror(_ value: Bool)
    {
        self.imageArrowGreen.isHidden = value
        self.imageArrowDarkGreen.isHidden = value
        self.imageArrowYellow.isHidden = value
        self.imageArrowOrange.isHidden = value
        self.imageArrowRed.isHidden = value
    }
    
    //MARK: - Actions
    @IBAction func buttonDownloadPressed(_ sender: UIButton)
    {
        performSegue(withIdentifier: "webViewSegue", sender: nil)
    }
    
}

//MARK: - InvestmentRequestDelegate
extension InvestmentViewController: InvestmentRequestDelegate
{
    func getValuesOfInvestments(_ investment: Investment)
    {
        // Properties that will setting value of labelAdministrationFee and labelAdministrationsData
        var administration = ""
        var administrationData = ""
        
        //Setting values
        self.labelTitle.text = investment.title
        self.labelFundName.text = investment.fundName
        self.labelWhatIs.text = investment.whatIs
        self.labelDefinition.text = investment.definition
        
        self.labelRiskTitle.text = investment.riskTitle
        
        self.labelInfoTitle.text = investment.infoTitle
        
        self.labelMonthCDI.text = "\(investment.month.cdi)%"
        self.labelMonthFund.text = "\(investment.month.fund)%"
        self.labelYearCDI.text = "\(investment.year.cdi)%"
        self.labelYearFund.text = "\(investment.year.fund)%"
        self.label12MonthsCDI.text = "\(investment.months.cdi)%"
        self.label12MonthsFund.text = "\(investment.months.fund)%"
        
        for i in 0..<investment.arrayInformations.count
        {
            //In the last element don't not put line break
            if i == investment.arrayInformations.count - 1
            {
                administration += investment.arrayInformations[i].name
                administrationData += investment.arrayInformations[i].data
            }
            else
            {
                administration += investment.arrayInformations[i].name + "\n"
                administrationData += investment.arrayInformations[i].data + "\n"
            }
        }
        self.labelAdministrationFee.text = administration
        self.labelAdministrationsData.text = administrationData
        
        //Setting labels space line
        self.labelAdministrationFee.setLineSpacing(lineHeightMultiple: 1.6)
        self.labelAdministrationsData.setLineSpacing(lineHeightMultiple: 1.6)
        
        self.labelAdministrationsData.textAlignment = .right
        
        self.labelEssential.text = investment.arrayDownInfos[0].name
        self.labelPerformance.text = investment.arrayDownInfos[1].name
        self.labelComplamentary.text = investment.arrayDownInfos[2].name
        self.labelRegulation.text = investment.arrayDownInfos[3].name
        self.labelMembership.text = investment.arrayDownInfos[4].name
        
        pointInvestmentRisk(investment.risk!)
        
        ActivityIndicator.stopActivity()
    }
}

