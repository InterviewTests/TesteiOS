//
//  InvestimentoViewController.swift
//  Teste_iOS_Santander
//
//  Created by Fabricio Rodrigues on 20/09/2018.
//  Copyright © 2018 Fabricio Rodrigues. All rights reserved.
//

import UIKit
import JMMaskTextField_Swift

protocol HomeDisplayLogic: class
{
    func displayInvestEntries(viewModel: HomeListScene.getInvestData.ViewModel)
    func displayFormEntries(viewModel: HomeListScene.getFormData.ViewModel)
}

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, HomeDisplayLogic, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var btInvestimento: UIButton!
    @IBOutlet weak var btContato: UIButton!
    @IBOutlet weak var viewButtonInvestSelected: UIView!
    @IBOutlet weak var viewButtonFormSelected: UIView!

    var objForm = PersonObj()
    var interactor = HomeInteractor()
    var viewN: ViewMessageViewController!
    var displayedInvestEntries = [String: InvestimentoObjectMapper]()
    var displayMoreInfoEntries = [String: MoreInfo]()
    var displayFormEntries = [String: [FormObjectMapper]]()
    var configCell = Config()
    var textFieldN: UITextField!
    var hasEmail: Bool! = false
    var hasPhone: Bool! = false
    var hasName: Bool! = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getInvest()
        getForm()
        self.showInvest(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
    }
    
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
    
    private func setup()
    {
        let viewController = self
        let interactor = HomeInteractor()
        let presenter = HomePresenter()
        viewController.interactor = interactor
        interactor.presenter = presenter
        presenter.viewController = viewController
    }
    
    @IBAction func showInvest(_ sender: Any) {
        viewButtonInvestSelected.isHidden = false
        viewButtonFormSelected.isHidden = true
        self.btContato.isSelected = false
        self.btInvestimento.isSelected = true
        btInvestimento.backgroundColor = UIColor.init(red: 200.0/255.0, green: 4.0/255.0, blue: 4.0/255.0, alpha: 1.0)
        btContato.backgroundColor = UIColor.init(red: 218.0/255.0, green: 1.0/255.0, blue: 1.0/255.0, alpha: 1.0)
        tableView.reloadData()


    }
    
    @IBAction func showForm(_ sender: Any) {
        tableView.scrollsToTop = true
        viewButtonInvestSelected.isHidden = true
        viewButtonFormSelected.isHidden = false
        self.btInvestimento.isSelected = false
        self.btContato.isSelected = true
        btContato.backgroundColor = UIColor.init(red: 200.0/255.0, green: 4.0/255.0, blue: 4.0/255.0, alpha: 1.0)
        btInvestimento.backgroundColor = UIColor.init(red: 218.0/255.0, green: 1.0/255.0, blue: 1.0/255.0, alpha: 1.0)
        tableView.reloadData()
    }
    
    func getInvest()
    {
        let request = HomeListScene.getInvestData.Request()
        interactor.getInvestData(request: request)
        tableView.reloadData()
    }
    
    func getForm(){
        let request = HomeListScene.getFormData.Request()
        interactor.getFormData(request: request)
        tableView.reloadData()
    }
    
    
    func displayInvestEntries(viewModel: HomeListScene.getInvestData.ViewModel) {
        self.btInvestimento.isSelected = true
        displayedInvestEntries = viewModel.displayInvestEntries
        tableView.reloadData()
        
        
    }
    
    func displayFormEntries(viewModel: HomeListScene.getFormData.ViewModel) {
        displayFormEntries = viewModel.displayFormEntries
        print("Form -> ",displayFormEntries["cells"]![0].message!)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
     func textFieldDidEndEditing(_ textField: UITextField) {
        
        let currentCell = textField.superview!.superview! // Get the cell
        let indexPath = tableView.indexPath(for: currentCell as! UITableViewCell)
        
        switch textField.tag {
        case 1:
            let cellTextF: CellTextField = tableView.cellForRow(at: indexPath!) as! CellTextField

            if (textField.text?.lengthOfBytes(using: .utf8))! > 0 {
                hasName = true
                objForm.name = textField.text
                cellTextF.lineView.backgroundColor = UIColor.green
            } else {
                hasName = false
                cellTextF.lineView.backgroundColor = UIColor.red
            }
        case 2:
            let cellTextF: CellTextField = tableView.cellForRow(at: indexPath!) as! CellTextField

            if (textField.text?.lengthOfBytes(using: .utf8))! > 13 {
                hasPhone = true
                objForm.phone = textField.text
                cellTextF.lineView.backgroundColor = UIColor.green
            } else {
                hasPhone = false
                cellTextF.lineView.backgroundColor = UIColor.red
            }
        case 3:
            let cellTextF: CellTextField = tableView.cellForRow(at: indexPath!) as! CellTextField
            
            if isValidEmail(testStr: textField.text!){
                hasEmail = true
                objForm.email = textField.text
                cellTextF.lineView.backgroundColor = UIColor.green
            } else {
                hasEmail = false
                cellTextF.lineView.backgroundColor = UIColor.red
            }
        default:
            print("Outros")
        }
        
    }
    
    func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        if textField.tag == 2 {
            
            guard let text = textField.text as NSString? else { return true }
            let newText = text.replacingCharacters(in: range, with: string)

            let maskTextField = textField as! JMMaskTextField
            maskTextField.maskString = "(00) 0 0000-0000"

            guard let unmaskedText = maskTextField.stringMask?.unmask(string: newText) else { return true }

            if unmaskedText.count >= 11 {
                maskTextField.maskString = "(00) 00000-0000"
                return true
            } else {
                maskTextField.maskString = "(00) 0000-0000"
                return true
            }

        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func sendForm() {
        if hasName && hasEmail && hasPhone {
            showSendView()
        } else {
            print("campos inválidos")
        }
    }
    
    func showSendView() {
        viewN = ViewMessageViewController()
        
        viewN.view.layer.frame = CGRect(x: 0, y: 0, width: self.view.layer.frame.width, height: self.view.layer.frame.height - btContato.layer.frame.height)
        viewN.bt.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        self.view.addSubview(viewN.view)
        
    }
    
    @objc func dismissView(){
        self.viewN.view.removeFromSuperview()
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
}


extension HomeViewController {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if btInvestimento.isSelected {
            return 4
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if displayedInvestEntries.count == 0 && displayFormEntries.count == 0 {
            return 0
        } else if self.btInvestimento.isSelected {
            
            switch section {
            case 0:
                return 1
            case 1:
                return displayedInvestEntries["screen"]!.info!.count
            case 2:
                return displayedInvestEntries["screen"]!.downInfo!.count
            default:
                return 1
            }
        } else if self.btContato.isSelected {
            return (displayFormEntries["cells"]?.count)!
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if self.btInvestimento.isSelected {
            
            switch indexPath.section {
            case 0:
                tableView.register(UINib(nibName: "InvestimentoHeaderCell", bundle: nil), forCellReuseIdentifier: "Cell")
                
                let cell: InvestimentoHeaderCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! InvestimentoHeaderCell
                cell.labelTitle.text = displayedInvestEntries["screen"]?.title
                cell.labelFundName.text = displayedInvestEntries["screen"]?.fundName
                cell.labelWhatIs.text = displayedInvestEntries["screen"]?.whatIs
                cell.labelRiskTitle.text = displayedInvestEntries["screen"]?.riskTitle
                
                cell.labelInfoTitle.text = displayedInvestEntries["screen"]?.infoTitle
                cell.labelMonthFund.text = String.init(format: "%.1f %%", (displayedInvestEntries["screen"]?.monthInfo!["fund"])!)
                cell.labelMonthCDI.text = String.init(format: "%.1f %%", (displayedInvestEntries["screen"]?.monthInfo!["CDI"])!)
                cell.labelYearFund.text = String.init(format: "%.1f %%", (displayedInvestEntries["screen"]?.yearInfo!["fund"])!)
                cell.labelYearCDI.text = String.init(format: "%.1f %%", (displayedInvestEntries["screen"]?.yearInfo!["CDI"])!)
                cell.labelLastFund.text = String.init(format: "%.1f %%", (displayedInvestEntries["screen"]?.lastInfo!["fund"])!)
                cell.labelLastCDI.text = String.init(format: "%.1f %%", (displayedInvestEntries["screen"]?.lastInfo!["CDI"])!)
                
                let imageRisk: Int = displayedInvestEntries["screen"]!.risk! - 1
                
                cell.arrayImageView[imageRisk].isHidden = false
                
                return cell
            case 1:
                tableView.register(UINib(nibName: "InfoTableViewCell", bundle: nil), forCellReuseIdentifier: "CellInfo")
                let cell: InfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellInfo") as! InfoTableViewCell
                
                cell.labelName.text = displayedInvestEntries["screen"]!.info![indexPath.row]["name"] as? String
                cell.labelData.text = displayedInvestEntries["screen"]!.info![indexPath.row]["data"] as? String
                
                return cell
            case 2:
                tableView.register(UINib(nibName: "InfoDownTableViewCell", bundle: nil), forCellReuseIdentifier: "CellDown")
                let cell: InfoDownTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellDown") as! InfoDownTableViewCell
                cell.labelName.text = displayedInvestEntries["screen"]!.downInfo![indexPath.row]["name"] as? String
                
                return cell
            default:
                tableView.register(UINib(nibName: "CellSend", bundle: nil), forCellReuseIdentifier: "CellSendForm")
                let cell: CellSend = tableView.dequeueReusableCell(withIdentifier: "CellSendForm") as! CellSend
                cell.btSend.setTitle("Investir", for: UIControlState.normal)
                cell.btSend.setBackgroundColor(color: UIColor.init(red: 199, green: 110, blue: 106, alpha: 1), forState: UIControlState.highlighted)
                return cell
                
            }
            
            
        } else if self.btContato.isSelected {
            
            switch self.displayFormEntries["cells"]![indexPath.row].type! {
                
            case Config.Fields.field.rawValue:
                tableView.register(UINib(nibName: "FormHeaderTableViewCell", bundle: nil), forCellReuseIdentifier: "CellHeaderForm")
                let cell: FormHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: "CellHeaderForm") as! FormHeaderTableViewCell
                return cell
            case Config.Fields.text.rawValue:
                tableView.register(UINib(nibName: "CellTextField", bundle: nil), forCellReuseIdentifier: "CellText")
                let cell: CellTextField = tableView.dequeueReusableCell(withIdentifier: "CellText") as! CellTextField
                
                
                if let valueTypeField = self.displayFormEntries["cells"]![indexPath.row].typefield {
                    switch valueTypeField {
                        
                    case Config.TypeField.text.rawValue:
                        cell.labelField.text = "Nome completo"
                        cell.textFieldForm.placeholder = "Nome completo"
                        cell.textFieldForm.delegate = self
                        cell.textFieldForm.tag = 1
                        textFieldN = cell.textFieldForm as! JMMaskTextField
                        return cell
                    case Config.TypeField.email.rawValue:
                        cell.labelField.text = "Email"
                        cell.textFieldForm.placeholder = "Email"
                        cell.textFieldForm.delegate = self
                        cell.textFieldForm.keyboardType = .emailAddress
                        textFieldN = cell.textFieldForm as! JMMaskTextField
                        cell.textFieldForm.tag = 3
                        return cell
                    case Config.TypeField.telNumber.rawValue:
                        cell.labelField.text = "Telefone"
                        cell.textFieldForm.placeholder = "Telefone"
                        cell.textFieldForm.delegate = self
                        //                            cell.textFieldForm.keyboardType = .numberPad
                        textFieldN = cell.textFieldForm as! JMMaskTextField
                        cell.textFieldForm.tag = 2
                        return cell
                    default:
                        cell.labelField.text = "Telefone"
                        cell.textFieldForm.placeholder = "Telefone"
                        cell.textFieldForm.delegate = self
                        cell.textFieldForm.keyboardType = .numberPad
                        textFieldN = cell.textFieldForm as! JMMaskTextField
                        cell.textFieldForm.tag = 2
                        return cell
                    }
                    
                } else {
                    cell.labelField.text = "Telefone"
                    cell.textFieldForm.placeholder = "Telefone"                    }
                cell.textFieldForm.delegate = self
                cell.textFieldForm.keyboardType = .numberPad
                textFieldN = cell.textFieldForm as! JMMaskTextField
                cell.textFieldForm.tag = 2
                
                return cell
                
            case Config.Fields.checkbox.rawValue:
                tableView.register(UINib(nibName: "CellCheckbox", bundle: nil), forCellReuseIdentifier: "CellCheckForm")
                let cell: CellCheckbox = tableView.dequeueReusableCell(withIdentifier: "CellCheckForm") as! CellCheckbox
                cell.labelMessage.text = self.displayFormEntries["cells"]![indexPath.row].message
                return cell
            case Config.Fields.send.rawValue:
                tableView.register(UINib(nibName: "CellSend", bundle: nil), forCellReuseIdentifier: "CellSendForm")
                let cell: CellSend = tableView.dequeueReusableCell(withIdentifier: "CellSendForm") as! CellSend
                cell.btSend.setTitle(self.displayFormEntries["cells"]![indexPath.row].message, for: UIControlState.normal)
                cell.btSend.setBackgroundColor(color: UIColor.init(red: 199, green: 110, blue: 106, alpha: 1), forState: UIControlState.highlighted)
                cell.btSend.addTarget(self, action: #selector(sendForm), for: .touchUpInside)
                return cell
                
            default:
                let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
                return cell
            }
        } else {
            let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if btInvestimento.isSelected {
            switch indexPath.section {
            case 0:
                return 667
            case 3:
                return 64
            default:
                return 44
            }
        } else {
            switch indexPath.row {
            case 0:
                return 145
            default:
                return 65
            }
        }
    }
}


