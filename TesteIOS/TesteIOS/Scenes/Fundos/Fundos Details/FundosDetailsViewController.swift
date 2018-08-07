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
    func displayError(error: FundosDetails.GetFund.ViewModel)
}

class FundosDetailsViewController: UIViewController, FundosDetailsDisplayLogic {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var fundNameLabel: UILabel!
    @IBOutlet weak var whatIsLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    @IBOutlet weak var riskTitle: UILabel!
    @IBOutlet weak var riskChart: UIView!
    @IBOutlet weak var infoTitleLabel: UILabel!
    @IBOutlet weak var monthFundLabel: UILabel!
    @IBOutlet weak var monthCDILabel: UILabel!
    @IBOutlet weak var yearFundLabel: UILabel!
    @IBOutlet weak var yearCDILabel: UILabel!
    @IBOutlet weak var twelveFundLabel: UILabel!
    @IBOutlet weak var twelveCDILabel: UILabel!
    
    @IBOutlet weak var infoTableView: UITableView!
    @IBOutlet weak var infoTableViewHeight: NSLayoutConstraint!
    
    var riskChartIndicatorImageView: UIImageView!
    
    
    var interactor: FundosDetailsBusinessLogic?
    var router: (NSObjectProtocol & FundosDetailsRoutingLogic & FundosDetailsDataPassing)?
    
    var displayedFundo: FundosDetails.GetFund.ViewModel.DisplayedFund?
    final let cellHeight: CGFloat = CGFloat(50)
    
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

        configTableView()
        configRiskChartIndicatorImageView()
        fetchFundo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarController?.navigationItem.title = "Investimento"
        configNavBarButton()
    }
    
    //    MARK: - Config
    func configNavBarButton(){
        let button = UIBarButtonItem(barButtonSystemItem: .action, target: nil, action: nil)
        tabBarController?.navigationItem.setRightBarButton(button, animated: false)
    }
    
    func configRiskChartIndicatorImageView(){
        let img = UIImage(named: "arrow_down")
        riskChartIndicatorImageView = UIImageView(image: img!)
        riskChart.addSubview(riskChartIndicatorImageView)
        
        setRiskChartIndicator(risk: 1)
    }
    
    func configTableView(){
        infoTableView.tableFooterView = UIView()
        infoTableView.delegate = self
        infoTableView.dataSource = self
        infoTableView.register(UINib(nibName: "FundosDetailsInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "InfoCell")
        infoTableView.register(UINib(nibName: "FundosDetailsDownInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "DownInfoCell")
    }
    
    func configLayout(){
        guard let fundo = displayedFundo else {
            return
        }
        
        infoTableView.reloadData()

        titleLabel.text = fundo.title
        fundNameLabel.text = fundo.fundName
        whatIsLabel.text = fundo.whatIs
        definitionLabel.text = fundo.definition
        riskTitle.text = fundo.riskTitle
        infoTitleLabel.text = fundo.infoTitle
        monthFundLabel.text = fundo.moreInfo.month.fund
        monthCDILabel.text = fundo.moreInfo.month.cdi
        yearFundLabel.text = fundo.moreInfo.year.fund
        yearCDILabel.text = fundo.moreInfo.year.cdi
        twelveFundLabel.text = fundo.moreInfo.twelveMonths.fund
        twelveCDILabel.text = fundo.moreInfo.twelveMonths.cdi
        
        setRiskChartIndicator(risk: fundo.risk)
    }
    
    func setRiskChartIndicator(risk: Int){
        let risk = CGFloat(risk)
        let indicatorWidth = CGFloat(20)
        let eachRiskWidth = riskChart.frame.width/CGFloat(5)
        let distanceX = eachRiskWidth*risk - (eachRiskWidth/CGFloat(2) + indicatorWidth/CGFloat(2))
        riskChartIndicatorImageView.frame = CGRect(x: distanceX, y: 0, width: indicatorWidth, height: indicatorWidth)
    }
    
    //    MARK: - Fetch Fundo
    func fetchFundo(){
        let request = FundosDetails.GetFund.Request()
        interactor?.fetchFundo(request: request)
    }
    
    func displayFundo(viewModel: FundosDetails.GetFund.ViewModel) {
        displayedFundo = viewModel.displayedFund
        configLayout()
    }
    
    func displayError(error: FundosDetails.GetFund.ViewModel) {
    }
}

extension FundosDetailsViewController: FundosDetailsDefaultCellDelegate, SafariViewControllerProtocol {
    func downloadButtonTouched() {
        let url = "https://google.com"
        openSafariView(at: url)
    }
}
