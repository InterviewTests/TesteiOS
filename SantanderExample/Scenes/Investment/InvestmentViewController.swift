//
//  InvestmentViewController.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 08/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

protocol InvestmentDisplayLogic: class {
  func displayInvestment(viewModel: Investment.GetInvestment.ViewModel)
  func displayError(title: String, message: String)
}

class InvestmentViewController: BaseViewController {
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var fundNameLabel: UILabel!
  @IBOutlet weak var whatIsLabel: UILabel!
  @IBOutlet weak var definitionLabel: UILabel!
  @IBOutlet weak var riskTitleLabel: UILabel!
  @IBOutlet weak var riskCollectionView: UICollectionView!
  @IBOutlet weak var infoTitleLabel: UILabel!
  @IBOutlet weak var investButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var monthFundLabel: UILabel!
  @IBOutlet weak var monthCDILabel: UILabel!
  @IBOutlet weak var yearFundLabel: UILabel!
  @IBOutlet weak var yearCDILabel: UILabel!
  @IBOutlet weak var pastYearFundLabel: UILabel!
  @IBOutlet weak var pastYearCDILabel: UILabel!
  @IBOutlet weak var fundInformationView: UIView!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  @IBOutlet weak var kHeightInformationTableView: NSLayoutConstraint!
  
  var interactor: InvestmentBusinessLogic?
  var riskAvailablesList: [InvestmentRiskCollectionViewCell.ViewModel] = []
  var fundInformationList: [Investment.InvestmentInformationTableCell.ViewModel] = []
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    registerNib()
    
    showLoading()
    interactor?.fetchInvestment()
    
  }
  
  private func setup() {
    let viewController = self
    let interactor = InvestmentInteractor()
    let presenter = InvestmentPresenter()
    let worker = InvestmentWorker()
    viewController.interactor = interactor
    interactor.presenter = presenter
    interactor.worker = worker
    presenter.viewController = viewController
  }
  
  private func registerNib() {
    riskCollectionView.register(UINib(nibName: "InvestmentRiskCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "InvestmentRiskCollectionViewCell")
    tableView.register(UINib(nibName: "InvestmentInformationTableViewCell", bundle: nil), forCellReuseIdentifier: "InvestmentInformationTableViewCell")
    
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = Investment.InvestmentInformationTableCell.CellSize.normal.rawValue
  }
  
  private func showLoading() {
    fundInformationView.isHidden = true
    loadingIndicator.isHidden = false
    loadingIndicator.startAnimating()
  }
  
  private func hideLoading() {
    fundInformationView.isHidden = false
    loadingIndicator.stopAnimating()
    loadingIndicator.isHidden = true
  }
  
  private func configureTableViewSize() {
    kHeightInformationTableView.constant = CGFloat(fundInformationList.count) * Investment.InvestmentInformationTableCell.CellSize.normal.rawValue
    
    UIView.animate(withDuration: 0.2) {
      self.view.setNeedsLayout()
      self.view.layoutIfNeeded()
    }
  }
}

extension InvestmentViewController: InvestmentDisplayLogic {
  
  func displayError(title: String, message: String) {
    hideLoading()
    
    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
    showAlert(title: title, message: message, actions: [okAction])
  }
  
  func displayInvestment(viewModel: Investment.GetInvestment.ViewModel) {
    hideLoading()
    titleLabel.text = viewModel.mainInformation.title
    fundNameLabel.text = viewModel.mainInformation.fund
    whatIsLabel.text = viewModel.mainInformation.whatIs
    definitionLabel.text = viewModel.mainInformation.definition
    riskTitleLabel.text = viewModel.mainInformation.riskTitle
    infoTitleLabel.text = viewModel.mainInformation.infoTitle
    monthFundLabel.text = viewModel.mainInformation.monthFund
    monthCDILabel.text = viewModel.mainInformation.monthCDI
    yearFundLabel.text = viewModel.mainInformation.yearFund
    yearCDILabel.text = viewModel.mainInformation.yearCDI
    pastYearFundLabel.text = viewModel.mainInformation.lastYearFund
    pastYearCDILabel.text = viewModel.mainInformation.lastYearCDI
    riskAvailablesList = viewModel.riskCollectionModels
    fundInformationList = viewModel.informationTableModels
    
    configureTableViewSize()
    tableView.reloadData()
    riskCollectionView.reloadData()
  }
}

extension InvestmentViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return fundInformationList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "InvestmentInformationTableViewCell", for: indexPath) as? InvestmentInformationTableViewCell
    
    cell?.viewModel = fundInformationList[indexPath.row]
    
    return cell ?? UITableViewCell()
  }
  
}

extension InvestmentViewController: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.size.width / CGFloat(riskAvailablesList.count), height: collectionView.frame.size.height)
  }
  
}

extension InvestmentViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return riskAvailablesList.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "InvestmentRiskCollectionViewCell", for: indexPath) as? InvestmentRiskCollectionViewCell
    
    cell?.viewModel = riskAvailablesList[indexPath.row]
    
    return cell ?? UICollectionViewCell()
  }
}

