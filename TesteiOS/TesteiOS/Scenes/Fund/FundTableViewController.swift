//
//  FundTableViewController.swift
//  TesteiOS
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import UIKit
import SafariServices

protocol FundsDisplayLogic: class {
    func displayFetchedFunds(viewModel: Funds.FetchFunds.ViewModel)
}

class FundTableViewController: UITableViewController, FundsDisplayLogic {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblFundName: UILabel!
    @IBOutlet weak var lblWhatIs: UILabel!
    @IBOutlet weak var lblDefinition: UILabel!
    @IBOutlet weak var lblRiskTitle: UILabel!
    @IBOutlet weak var imvRisk: UIImageView!
    @IBOutlet weak var lblInfoTitle: UILabel!
    @IBOutlet weak var lblMonthFundo: UILabel!
    @IBOutlet weak var lblMonthCDI: UILabel!
    @IBOutlet weak var lblYearFundo: UILabel!
    @IBOutlet weak var lblYearCDI: UILabel!
    @IBOutlet weak var lbl12MonthFundo: UILabel!
    @IBOutlet weak var lbl12MonthCDI: UILabel!
    @IBOutlet weak var lblNameInfo0: UILabel!
    @IBOutlet weak var lblDataInfo0: UILabel!
    @IBOutlet weak var lblNameInfo1: UILabel!
    @IBOutlet weak var lblDataInfo1: UILabel!
    @IBOutlet weak var lblNameInfo2: UILabel!
    @IBOutlet weak var lblDataInfo2: UILabel!
    @IBOutlet weak var lblNameInfo3: UILabel!
    @IBOutlet weak var lblDataInfo3: UILabel!
    @IBOutlet weak var lblNameInfo4: UILabel!
    @IBOutlet weak var lblDataInfo4: UILabel!
    @IBOutlet weak var lblNameInfo5: UILabel!
    @IBOutlet weak var lblDataInfo5: UILabel!
    @IBOutlet weak var lblNameInfo6: UILabel!
    @IBOutlet weak var lblDataInfo6: UILabel!
    @IBOutlet weak var lblNameDownInfo0: UILabel!
    @IBOutlet weak var lblNameDownInfo1: UILabel!
    @IBOutlet weak var lblNameDownInfo2: UILabel!
    @IBOutlet weak var lblNameDownInfo3: UILabel!
    @IBOutlet weak var lblNameDownInfo4: UILabel!
    
    var interactor: FundsBusinessLogic?
    var displayedFunds: [Funds.FetchFunds.ViewModel.DisplayedFund] = []
    
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
        let interactor = FundsInteractor()
        let presenter = FundsPresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    // MARK: - View lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.navigationItem.title = "Investimento"
        self.tabBarController?.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        self.tabBarController?.setSelectionIndicatorColor(color: UIColor.unselectedRed)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchFunds()
    }
    
    // MARK: - Fetch cells
    
    func fetchFunds() {
        let request = Funds.FetchFunds.Request()
        interactor?.fetchFunds(request: request)
    }
    
    func displayFetchedFunds(viewModel: Funds.FetchFunds.ViewModel) {
        displayedFunds = viewModel.displayedFunds
        if let fund: Funds.FetchFunds.ViewModel.DisplayedFund = displayedFunds.first {
            Thread.isMainThread ? self.updateDisplay(fund: fund) : DispatchQueue.main.sync { self.updateDisplay(fund: fund) }
        }
    }
    
    func updateDisplay (fund: Funds.FetchFunds.ViewModel.DisplayedFund) {
        print("updating labels")
        self.lblTitle.text = fund.title
        self.lblFundName.text = fund.fundName
        self.lblWhatIs.text = fund.whatIs
        self.lblDefinition.text = fund.definition
        self.lblRiskTitle.text = fund.riskTitle
        self.imvRisk.image = UIImage(named: "risk\(fund.risk)")
        self.lblInfoTitle.text = fund.infoTitle
        self.lblMonthFundo.text = "\(fund.moreInfo.month.fund)%"
        self.lblMonthCDI.text = "\(fund.moreInfo.month.cdi)%"
        self.lblYearFundo.text = "\(fund.moreInfo.year.fund)%"
        self.lblYearCDI.text = "\(fund.moreInfo.year.cdi)%"
        self.lbl12MonthFundo.text = "\(fund.moreInfo.twelveMonths.fund)%"
        self.lbl12MonthCDI.text = "\(fund.moreInfo.twelveMonths.cdi)%"
        self.lblNameInfo0.text = fund.info[0].name
        self.lblDataInfo0.text = fund.info[0].data
        self.lblNameInfo1.text = fund.info[1].name
        self.lblDataInfo1.text = fund.info[1].data
        self.lblNameInfo2.text = fund.info[2].name
        self.lblDataInfo2.text = fund.info[2].data
        self.lblNameInfo3.text = fund.info[3].name
        self.lblDataInfo3.text = fund.info[3].data
        self.lblNameInfo4.text = fund.info[4].name
        self.lblDataInfo4.text = fund.info[4].data
        self.lblNameInfo5.text = fund.info[5].name
        self.lblDataInfo5.text = fund.info[5].data
        self.lblNameInfo6.text = fund.info[6].name
        self.lblDataInfo6.text = fund.info[6].data
        self.lblNameDownInfo0.text = fund.info[0].name
        self.lblNameDownInfo1.text = fund.info[1].name
        self.lblNameDownInfo2.text = fund.info[2].name
        self.lblNameDownInfo3.text = fund.info[3].name
        self.lblNameDownInfo4.text = fund.info[4].name
//        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fetch () {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")
        let task = URLSession.shared.dataTask(with: url!) {(data, response, error) in
            let jsonString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print(jsonString ?? "Erro")
            
            do {
                let decoder = JSONDecoder()
                let fundContainer = try decoder.decode(FundContainer.self, from: data!)
                
                DispatchQueue.main.sync{
//                    self..text = fundContainer.fund.
                    
                }
                
            } catch let error {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func buttonDownloadClicked(_ sender: UIButton) {
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) {
            let safariViewController = SFSafariViewController(url: url, entersReaderIfAvailable: true)
            self.present(safariViewController, animated: true)
        }
    }
}
