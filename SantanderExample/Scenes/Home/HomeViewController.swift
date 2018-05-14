//
//  HomeViewController.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 08/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

protocol HomeDisplayLogic: class {
  func displayInvestmentController()
  func displayContactController()
}

class HomeViewController: UIViewController {
  
  var interactor: HomeBusinessLogic?
  var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
  
  // MARK: Variables
  @IBOutlet weak var containerView: UIView!
  @IBOutlet weak var investmentButton: UIButton!
  @IBOutlet weak var contactButton: UIButton!
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: View lifecycle
  override func viewDidLoad(){
    super.viewDidLoad()
    displayInvestmentController()
  }
  
  private func setup() {
    let viewController = self
    let interactor = HomeInteractor()
    let presenter = HomePresenter()
    let router = HomeRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  @IBAction func investmentButtonTouchUpInside(_ sender: Any) {
    interactor?.showInvestmentController()
  }
  
  @IBAction func contactButtonTouchUpInside(_ sender: Any) {
    interactor?.showContactController()
  }
}

extension HomeViewController: HomeDisplayLogic {
  func displayContactController() {
    router?.routeToContact(containerView: containerView)
    contactButton.backgroundColor = UIColor.init(hex: "CE0000")
    investmentButton.backgroundColor = UIColor.init(hex: "DA0101")
  }
  
  func displayInvestmentController() {
    router?.routeToInvestment(containerView: containerView)
    investmentButton.backgroundColor = UIColor.init(hex: "CE0000")
    contactButton.backgroundColor = UIColor.init(hex: "DA0101")
  }
}
