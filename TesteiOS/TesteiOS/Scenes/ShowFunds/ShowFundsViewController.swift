//
//  ShowFundsViewController.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

typealias ViewModel = ShowFunds.Funds.ViewModel

protocol ShowFundsDisplayLogic: class {
    func display(viewModel: ShowFunds.Funds.ViewModel)
    func displayError()
}

class ShowFundsViewController: UIViewController, ShowFundsDisplayLogic {
    
    var interactor: ShowFundsBusinessLogic?

    
    // MARK: Outlets
    @IBOutlet weak var screenTitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fundNameLabel: UILabel!
    @IBOutlet weak var descriptionTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var riskTitleLabel: UILabel!
    @IBOutlet weak var riskMeter: RiskMeter!
    @IBOutlet weak var extraInfoTitleLabel: UILabel!
    @IBOutlet var fundLabels: [UILabel]!
    @IBOutlet var CDILabels: [UILabel]!
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var bottomSeparator: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var investButton: UIButton!
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
  
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
  
  // MARK: Setup
  
    private func setup() {
        let viewController = self
        let interactor = ShowFundsInteractor()
        let presenter = ShowFundsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }

  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()

        request()
    }
    
    func request() {
        let request = ShowFunds.Funds.Request()
        interactor?.requestData(request: request)
    }
  
    func display(viewModel: ShowFunds.Funds.ViewModel) {
        
        // Ensure this code will be called in the main thread
        DispatchQueue.main.async {
            self.titleLabel.text = viewModel.title
            self.fundNameLabel.text = viewModel.fundName
            self.descriptionTitleLabel.text = viewModel.whatIs
            self.descriptionLabel.text = viewModel.definition
            self.riskTitleLabel.text = viewModel.riskTitle
            self.riskMeter.riskIndex = viewModel.risk - 1
            self.extraInfoTitleLabel.text = viewModel.infoTitle
            
            for (index, element) in self.fundLabels.enumerated() {
                element.text = viewModel.moreInfoFunds[index]
            }
            
            for (index, element) in self.CDILabels.enumerated() {
                element.text = viewModel.moreInfoCDI[index]
            }
            
            self.buildDownInfo(viewModel: viewModel)
        }
    }
    
    func buildDownInfo(viewModel: ViewModel) {
        
        if viewModel.infoNames.count + viewModel.downInfoNames.count == 0 {
            return
        }
        
//        var closestTopView: UIView = bottomSeparator
//        self.buttonTopConstraint.isActive = false
//        
//        let label = UILabel()
//        label.text = viewModel.infoNames[0]
//        label.font = UIFont(name: "DINPro-Medium", size: 16)
//        contentView.addSubview(label)
//        
//        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
//        label.topAnchor.constraint(equalTo: closestTopView.bottomAnchor, constant: 30).isActive = true
//        closestTopView = label
//        
//        self.investButton.topAnchor.constraint(equalTo: closestTopView.bottomAnchor, constant: 45).isActive = true
        
        
//        let label2 = UILabel()
//        label2.text = viewModel.infoData[0]
//        label2.font = UIFont(name: "DINPro-Medium", size: 16)
        
        
        
        
        
    }
    
    func displayError() {
        let controller = UIAlertController(title: "Erro", message: "Temos um problema. Tente novamente mais tarde", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        
        self.present(controller, animated: true, completion: nil)
    }
}
