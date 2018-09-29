//
//  InvestmentViewController.swift
//  Profile
//
//  Created by Renee Alves on 28/09/18.
//  Copyright © 2018 Renee Alves. All rights reserved.
//

import UIKit
import SafariServices

protocol ShowInvestmentLogic: class {
    func displayInvestment(displayedInvestment: ShowInvestment.GetInvestment.ViewModel.DisplayedInvestment)
    func display(risk: String)
}

class InvestmentViewController: UIViewController, ShowInvestmentLogic, SFSafariViewControllerDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!
    
    @IBOutlet weak var screenTitle: UILabel!
    @IBOutlet weak var investmentFundName: UILabel!
    @IBOutlet weak var whatIsLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var riskTitleLabel: UILabel!
    @IBOutlet weak var infoTitleLabel: UILabel!
    
    @IBOutlet weak var monthlyFundValueLabel: UILabel!
    @IBOutlet weak var monthlyCDIValueLabel: UILabel!
    @IBOutlet weak var yearFundValueLabel: UILabel!
    @IBOutlet weak var yearCDIValueLabel: UILabel!
    @IBOutlet weak var accumulatedFundValueLabel: UILabel!
    @IBOutlet weak var accumulatedCDIValueLabel: UILabel!
    
    @IBOutlet weak var administrationFeeLabel: UILabel!
    @IBOutlet weak var adminstrationFeeValueLabel: UILabel!
    @IBOutlet weak var initialApplicationLabel: UILabel!
    @IBOutlet weak var initialApplicationValueLabel: UILabel!
    @IBOutlet weak var minMovementLabel: UILabel!
    @IBOutlet weak var minMovementValueLabel: UILabel!
    @IBOutlet weak var minBalance: UILabel!
    @IBOutlet weak var minBalanceValue: UILabel!
    @IBOutlet weak var dischargeLabel: UILabel!
    @IBOutlet weak var dischargeValueLabel: UILabel!
    @IBOutlet weak var quotaLabel: UILabel!
    @IBOutlet weak var quotaValueLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var paymentValueLabel: UILabel!
    @IBOutlet weak var essentialsLabel: UILabel!
    @IBOutlet weak var performanceLabel: UILabel!
    @IBOutlet weak var complementaryLabel: UILabel!
    @IBOutlet weak var statuteLabel: UILabel!
    @IBOutlet weak var adhesionLabel: UILabel!
    @IBOutlet weak var investButton: UIButton!
    
    
    @IBOutlet weak var risk1: UILabel!
    @IBOutlet weak var risk2: UILabel!
    @IBOutlet weak var risk3: UILabel!
    @IBOutlet weak var risk4: UILabel!
    @IBOutlet weak var risk5: UILabel!
    
    var interactor: InvestmentLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupScrollViewContentSize()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupScrollView()
        setupScrollViewContentSize()
        self.title = "Investimento"
    }
    
    override func viewDidLayoutSubviews() {
        
        setupScrollViewContentSize()
    }
    
    private func setupScrollViewContentSize () {
        
        var heigth: CGFloat = 0.0
        var position: CGFloat = 0.0
        
        heigth      = investButton.frame.size.height
        position    = investButton.frame.origin.y
        
        let sizeOfContent               = heigth + position + 20
        
        scrollView.contentSize.height   = sizeOfContent
    }
    
    fileprivate func setupScrollView() {
        
        scrollView.isScrollEnabled    = true
        scrollView.contentSize = CGSize(width: scrollView.frame.size.width, height: scrollView.frame.size.height)
    }
    
    private func setup()
    {
        let viewController = self
        let interactor = ShowInvestmentInteractor()
        let presenter = ShowInvestmentPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.view = viewController
        
        interactor.fetchData()
    }
    
    @IBAction func downloadSpecs(sender: UIButton) {
        
        let url = URL(string: "https://www.google.com.br")
        let controller = SFSafariViewController(url: url!)
        controller.delegate = self
        
        self.present(controller, animated: true, completion: nil)
    }
    
    func displayInvestment(displayedInvestment: ShowInvestment.GetInvestment.ViewModel.DisplayedInvestment) {
        
        screenTitle.text = displayedInvestment.screenTitle
        investmentFundName.text = displayedInvestment.investmentFundName
        whatIsLabel.text = displayedInvestment.whatIs
        definitionLabel.text = displayedInvestment.definition
        riskTitleLabel.text = displayedInvestment.riskTitle
        infoTitleLabel.text = displayedInvestment.infoTitle
        monthlyFundValueLabel.text = "\(displayedInvestment.monthlyFundValue)%"
        monthlyCDIValueLabel.text = "\(displayedInvestment.monthlyCDIValue)%"
        yearFundValueLabel.text = "\(displayedInvestment.yearFundValue)%"
        yearCDIValueLabel.text = "\(displayedInvestment.yearCDIValue)%"
        accumulatedFundValueLabel.text = "\(displayedInvestment.accumulatedFundValue)%"
        accumulatedCDIValueLabel.text = "\(displayedInvestment.accumulatedCDIValue)%"
        
        var investmentInfo : [UILabel] = [administrationFeeLabel, adminstrationFeeValueLabel, initialApplicationLabel, initialApplicationValueLabel, minMovementLabel, minMovementValueLabel, minBalance, minBalanceValue, dischargeLabel, dischargeValueLabel, quotaLabel, quotaValueLabel, paymentLabel, paymentValueLabel]
        
        for i in 0..<displayedInvestment.investmentInfo.count {
            
            investmentInfo[i].text = displayedInvestment.investmentInfo[i]
            investmentInfo[i].adjustsFontSizeToFitWidth = true
        }
        
        var downInfo : [UILabel] = [essentialsLabel, performanceLabel, complementaryLabel, statuteLabel, adhesionLabel]
        
        for i in 0..<displayedInvestment.downloadInfo.count {
            
            downInfo[i].text = displayedInvestment.downloadInfo[i]
            downInfo[i].adjustsFontSizeToFitWidth = true
        }
        DispatchQueue.main.async {
            self.display(risk: displayedInvestment.risk)
        }
    }
    
    func display(risk: String) {
        switch risk {
        case "1":
            risk1.isHidden = false
        case "2":
            risk2.isHidden = false
        case "3":
            risk3.isHidden = false
        case "4":
            risk4.isHidden = false
        case "5":
            risk4.isHidden = false
        default:
            break
        }
    }
}
