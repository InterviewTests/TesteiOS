//
//  FundosDetailsViewController.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 06/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

protocol FundosDetailsDisplayLogic: class {
    func displayFundo(viewModel: FundosDetails.GetFund.ViewModel)
}

class FundosDetailsViewController: UIViewController, FundosDetailsDisplayLogic {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fundNameLabel: UILabel!
    @IBOutlet weak var whatIsLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var riskTitle: UILabel!
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var monthFundLabel: UILabel!
    @IBOutlet weak var monthCDILabel: UILabel!
    @IBOutlet weak var yearFundLabel: UILabel!
    @IBOutlet weak var yearCDILabel: UILabel!
    @IBOutlet weak var twelveFundLabel: UILabel!
    @IBOutlet weak var twelveCDILabel: UILabel!
    
    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var infoTableViewHeight: NSLayoutConstraint!
    
    
    var interactor: FundosDetailsBusinessLogic?
    var router: (NSObjectProtocol & FundosDetailsRoutingLogic & FundosDetailsDataPassing)?
    
    var displayedFundo: FundosDetails.GetFund.ViewModel.DisplayedFund!
    
    //    MARK: - Object Lifecycle
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setup()
    }
    
    //    MARK: - Setup
    func setup(){
        let viewController = self
        let interactor = FundosDetailsInteractor()
        let presenter = FundosDetailsPresenter()
        let router = FundosDetailsRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    //    MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchFundo()
    }
    
    //    MARK: - Fetch Fundo
    func fetchFundo(){
        let request = FundosDetails.GetFund.Request()
        interactor?.fetchFundo(request: request)
    }
    
    func displayFundo(viewModel: FundosDetails.GetFund.ViewModel) {
        
    }

}
