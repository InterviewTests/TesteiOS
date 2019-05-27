//
//  investmentoViewController.swift
//  santanderTest
//
//  Created by Adauto Oliveira on 27/05/19.
//  Copyright (c) 2019 Adauto Oliveira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import SafariServices

protocol investmentoDisplayLogic: class
{
  func displaySomething(viewModel: investmento.Something.ViewModel)
}

class investmentoViewController: UITableViewController, investmentoDisplayLogic, SFSafariViewControllerDelegate
{
  var interactor: investmentoBusinessLogic?
  var router: (NSObjectProtocol & investmentoRoutingLogic & investmentoDataPassing)?

  // MARK: Object lifecycle
  
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
  
  // MARK: Setup
  
  private func setup()
  {
    let viewController = self
    let interactor = investmentoInteractor()
    let presenter = investmentoPresenter()
    let router = investmentoRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?)
  {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    doSomething()
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
    @IBAction func safariView(_ sender: UIButton) {
        
        guard let url = URL(string: "https://www.google.com.br/search?=") else {
            return
        }
        
        let safariVC = SFSafariViewController(url: url)
        safariVC.delegate = self
        present(safariVC, animated: true, completion: nil)
        
    }
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnInvestir(_ sender: UIButton) {
        let alert: UIAlertController = UIAlertController(title: "Invetimento", message: "Parabéns investimento realizado com sucesso !", preferredStyle: .alert)
        
        let actionOk: UIAlertAction = UIAlertAction(title: "Ok", style: .default) { (acao) in
            
            
        }
        
        alert.addAction(actionOk)
        self.present(alert, animated: true, completion: nil)
      
    }
    
 
    func doSomething()
  {
    let request = investmento.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: investmento.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
