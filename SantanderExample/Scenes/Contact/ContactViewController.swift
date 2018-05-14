//
//  ContactViewController.swift
//  SantanderExample
//
//  Created by Luan Henrique Damasceno Costa on 08/05/2018.
//  Copyright © 2018 Luan Henrique Damasceno Costa. All rights reserved.
//

import UIKit

protocol ContactDisplayLogic: class {
  func displayContactForm(viewModel: Contact.Form.ViewModel)
  func displayError(title: String, message: String)
}

class ContactViewController: BaseViewController {

  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
  
  var interactor: ContactBusinessLogic?
  var formList: [Contact.ContactFormCell.ViewModel] = []
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  func setup() {
    let viewController = self
    let interactor = ContactInteractor()
    let presenter = ContactPresenter()
    let worker = ContactWorker()
    viewController.interactor = interactor
    interactor.presenter = presenter
    interactor.worker = worker
    presenter.viewController = viewController
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    registerNib()
    tableView.reloadData()
    
    handleKeyboard()
    showLoading()
    interactor?.fetchContactForm()
  }
  
  private func registerNib() {
    tableView.register(UINib(nibName: "ContactSendTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactSendTableViewCell")
    tableView.register(UINib(nibName: "ContactTextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTextFieldTableViewCell")
    tableView.register(UINib(nibName: "ContactTextTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactTextTableViewCell")
    tableView.register(UINib(nibName: "ContactCheckboxTableViewCell", bundle: nil), forCellReuseIdentifier: "ContactCheckboxTableViewCell")
  }
  
  private func showLoading() {
    activityIndicatorView.isHidden = false
    activityIndicatorView.startAnimating()
  }
  
  private func hideLoading() {
    activityIndicatorView.stopAnimating()
    activityIndicatorView.isHidden = true
  }
  
  private func handleKeyboard() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: .UIKeyboardWillHide, object: nil)
  }
  
  @objc func keyboardWillShow(notification: NSNotification) {
    adjustInsetForKeyboardShow(show: true, notification: notification)
  }
  
  @objc func keyboardWillHide(notification: NSNotification) {
    adjustInsetForKeyboardShow(show: false, notification: notification)
  }
  
  func adjustInsetForKeyboardShow(show: Bool, notification: NSNotification) {
    let userInfo = notification.userInfo ?? [:]
    
    guard let keyboardFramePresent = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue,
      let keyboardFrameDismiss = (userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue else {
        return
    }
    let keyboardFrame = (show) ? keyboardFramePresent : keyboardFrameDismiss
    
    let adjustment = keyboardFrame.height * (show ? 1 : -1)
    
    tableView.contentInset.bottom += (adjustment)
    tableView.scrollIndicatorInsets.bottom += (adjustment)
  }
}

extension ContactViewController: ContactDisplayLogic {
  
  func displayContactForm(viewModel: Contact.Form.ViewModel) {
    hideLoading()
    formList = viewModel.contactListForm
    tableView.reloadData()
  }
  
  func displayError(title: String, message: String) {
    hideLoading()
    showAlert(title: title, message: message, actions: [UIAlertAction(title: "Ok", style: .default, handler: nil)])
  }
}

extension ContactViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    let form = formList[indexPath.row]
    
    switch form.type {
    case .checkbox:
       return Contact.ContactFormCell.CellSize.checkbox.rawValue + CGFloat(form.topSpacing)
      
    case .text:
      return Contact.ContactFormCell.CellSize.text.rawValue + CGFloat(form.topSpacing)
      
    default:
       return Contact.ContactFormCell.CellSize.normal.rawValue + CGFloat(form.topSpacing)
    }
  }
}

extension ContactViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return formList.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let form = formList[indexPath.row]
    
    switch form.type {
    case .text:
      let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTextTableViewCell", for: indexPath) as? ContactTextTableViewCell
      
      cell?.viewModel = form
      
      return cell ?? UITableViewCell()
      
    case.field:
      let cell = tableView.dequeueReusableCell(withIdentifier: "ContactTextFieldTableViewCell", for: indexPath) as? ContactTextFieldTableViewCell
      
      cell?.viewModel = form
      
      return cell ?? UITableViewCell()
      
    case .send:
      let cell = tableView.dequeueReusableCell(withIdentifier: "ContactSendTableViewCell", for: indexPath) as? ContactSendTableViewCell
      
      cell?.viewModel = form
      
      return cell ?? UITableViewCell()
      
    case .checkbox:
      let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCheckboxTableViewCell", for: indexPath) as? ContactCheckboxTableViewCell
      
      cell?.viewModel = form
      
      return cell ?? UITableViewCell()
      
    default:
      return UITableViewCell()
    }
  }
}
