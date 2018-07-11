//
//  SendMessageViewController.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

protocol SendMessageDisplayLogic: class {
    func display(viewModel: SendMessage.Something.ViewModel)
    func displayError()
}

typealias FormItem = SendMessage.FormItem

class SendMessageViewController: UIViewController, SendMessageDisplayLogic, FormController {
    var interactor: SendMessageBusinessLogic?
    var textFields: [UITextField] = []
    var activeTextField: UITextField?
    @IBOutlet weak var formTableView: UITableView!
    // MARK: Object lifecycle
    
    var models = [FormItem]()
    var indexesToHide = [Int]()
  
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
        let interactor = SendMessageInteractor()
        let presenter = SendMessagePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
  
  // MARK: View lifecycle
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        requestForm()
        
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyboardWasShown(notification:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default
            .addObserver(self, selector: #selector(keyboardWillHide(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func setupTableView() {
        let fieldCellNib = UINib(nibName: "FieldTableViewCell", bundle: nil)
        let textCellNib = UINib(nibName: "TextTableViewCell", bundle: nil)
        let checkBoxNib = UINib(nibName: "CheckboxTableViewCell", bundle: nil)
        let sendNib = UINib(nibName: "SendTableViewCell", bundle: nil)
        
        formTableView.register(fieldCellNib, forCellReuseIdentifier: Constants.kFieldCellIdentifier)
        formTableView.register(textCellNib, forCellReuseIdentifier: Constants.kTextCellIdentifier)
        formTableView.register(checkBoxNib, forCellReuseIdentifier: Constants.kCheckboxCellIdentifier)
        formTableView.register(sendNib, forCellReuseIdentifier: Constants.kSendCellIdentifier)
    }
    
    func requestForm() {
        let request = SendMessage.Something.Request()
        interactor?.request(request: request)
    }
  
    func display(viewModel: SendMessage.Something.ViewModel) {
        models = viewModel.items
        formTableView.reloadData()
    }
    
    @objc func keyboardWasShown(notification: Notification) {
        if let info = notification.userInfo {
            let keyboardRect = info["UIKeyboardFrameEndUserInfoKey"] as! CGRect
            
            let contentInsets = UIEdgeInsetsMake(0, 0, keyboardRect.height, 0)
            self.formTableView.contentInset = contentInsets
            self.formTableView.scrollIndicatorInsets = contentInsets
            
            var viewRect = self.view.frame
            viewRect.size.height -= keyboardRect.height
            
            if !viewRect.contains((activeTextField?.frame.origin)!) {
                let scrollPoint = CGPoint(x: 0, y: (activeTextField?.frame.origin.y)! - (keyboardRect.height - 15))
                formTableView.setContentOffset(scrollPoint, animated: true)
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        let insets = UIEdgeInsets.zero
        self.formTableView.contentInset = insets
        self.formTableView.scrollIndicatorInsets = insets
    }
    
    func hideID(id: Int) {
        let item = models.filter { formItem in
            formItem.id == id
        }.first
        
        guard let formItem = item, let index = models.index(of: formItem) else {
            return
        }
        
        indexesToHide.append(index)
        formTableView.reloadRows(at: [IndexPath(row: index + 1, section: 0)], with: .fade)
    }
    
    func showID(id: Int) {
        let item = models.filter { formItem in
            formItem.id == id
            }.first
        
        guard let formItem = item, let index = models.index(of: formItem) else {
            return
        }
        
        indexesToHide.remove(at: indexesToHide.index(of: index)!)
        formTableView.reloadRows(at: [IndexPath(row: index + 1, section: 0)], with: .fade)
    }
}

// MARK: UITableViewDataSource
extension SendMessageViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.kTextCellIdentifier) as! TextTableViewCell
            cell.textLabel?.font = UIFont(name: "DINPro-Medium", size: 17.0)
            cell.textlabel.textAlignment = .center
            cell.textlabel.textColor = UIColor.CustomColor.veryDarkGray
            cell.bottomBar.isHidden = true
            cell.textlabel.text = "Contato"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: models[indexPath.row - 1].type.identifier) as? FormTableViewCell
            cell?.configure(with: models[indexPath.row - 1], controller: self)
            return cell as? UITableViewCell ?? UITableViewCell()
        }
    }
}

extension SendMessageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (indexesToHide.contains(indexPath.row - 1)) ? 0 : UITableViewAutomaticDimension
    }
}

// MARK: UITextFieldDelegate
extension SendMessageViewController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.activeTextField = nil
    }
}



