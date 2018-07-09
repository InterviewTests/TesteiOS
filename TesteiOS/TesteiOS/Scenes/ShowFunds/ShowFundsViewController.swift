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
 
    
    @objc func openSafariPage() {
        if let url = URL(string: "https://www.google.com") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func displayError() {
        let controller = UIAlertController(title: "Erro", message: "Temos um problema, Tente novamente mais tarde", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        controller.addAction(action)
        
        self.present(controller, animated: true, completion: nil)
    }
}
