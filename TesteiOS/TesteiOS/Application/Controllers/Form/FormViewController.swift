//
//  FormViewController.swift
//  TesteiOS
//
//  Created by anderson.jesus.silva on 07/05/19.
//  Copyright © 2019 anderson.jesus.silva. All rights reserved.
//

import UIKit
import MaterialComponents

class FormViewController: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    
    var total:Int = 0
    var objListCell:[CellList]?
    var objListCellAdd:[CellList]?
    var interactor: FormInteractorInput!
    var type:Type?
    var check:Bool = true
    var index:IndexPath!
    var arrFields:[ValidateValues] = [ValidateValues]()
    var segue:String?
    
    var txFieldController: MDCTextInputControllerLegacyDefault?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.showLoading()
        hideKeyboardWhenTappedAround()
        FormWireframe.configurate(viewcontroller: self)
        self.interactor.loadForm()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.arrFields.removeAll()
        self.segue = nil
    }

    @IBAction func btnInvestimentoTapped(_ sender: ButtonStyle) {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func loadXibs() {
        TextFieldTableViewCell.register(to: self.tbView)
        BtnFormTableViewCell.register(to: self.tbView)
        TitleFormTableViewCell.register(to: self.tbView)
        CheckFormTableViewCell.register(to: self.tbView)
        
        self.tbView.delegate = self
        self.tbView.dataSource = self
        self.tbView.reloadData()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension FormViewController: UITableViewDelegate, UITableViewDataSource, BtnFormTableViewCellDelegate, TextFieldTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.total
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let list = self.objListCell {
            
            let formCell = list[indexPath.row]
            let type:Type = Type(rawValue: formCell.type!)!
            self.index = indexPath
            
            switch type {
            case .text:
                let titleFormTableViewCell = self.tbView.dequeueReusableCell(withIdentifier: "TitleFormTableViewCell") as! TitleFormTableViewCell
                titleFormTableViewCell.setup(cell: formCell)
                return titleFormTableViewCell
            case .field:
                let textFieldTableViewCell = self.tbView.dequeueReusableCell(withIdentifier: "TextFieldTableViewCell") as! TextFieldTableViewCell
                textFieldTableViewCell.setup(cell: formCell)
                textFieldTableViewCell.delegate = self
                return textFieldTableViewCell
            case .checkbox:
                let checkFormTableViewCell = self.tbView.dequeueReusableCell(withIdentifier: "CheckFormTableViewCell") as! CheckFormTableViewCell
                checkFormTableViewCell.setup(cell: formCell, self.check, row: indexPath.row)
                checkFormTableViewCell.delegate = self
                return checkFormTableViewCell
            case .send:
                let btnFormTableViewCell = self.tbView.dequeueReusableCell(withIdentifier: "BtnFormTableViewCell") as! BtnFormTableViewCell
                btnFormTableViewCell.delegate = self
                return btnFormTableViewCell
            default:
                return UITableViewCell()
            }
            
        }
        return UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if let list = self.objListCell {
            let formCell = list[indexPath.row]
            
            if let topSpacing = formCell.topSpacing {
                let min = 50 + topSpacing
                let max = 65 + topSpacing
                let height = ((self.tbView.frame.height - 44.0) / CGFloat(1)) + CGFloat(topSpacing)
                
                let h = CGFloat.minimum(CGFloat(max), height)
                return CGFloat.maximum(h, CGFloat(min))
            }
            
        }
        return UITableView.automaticDimension
    }
    
    func segue(value:String) {
        
        
        if self.arrFields.count >= 3 {
            self.segue = value
            self.interactor.validateFields(arr: self.arrFields)
        }else{
            self.alertMesage(title: "Teste", msg: "Por favor, preencha os campos obrigatórios", btn: "OK")
        }
        
    }
    
    func sendFields(validateValues:ValidateValues) {
        self.arrFields.append(validateValues)
    }
    
}

extension FormViewController: FormPresenterProtocol {
    
    func loadForm(listCell:[CellList]) {
        self.total = listCell.count
        self.objListCell = listCell
        self.objListCellAdd = listCell
        self.loadXibs()
        self.hideLoading()
    }
    
    func failureView(msg:String) {
        self.alertMesage(title: "Teste", msg: msg, btn: "OK")
    }
    
    func successValidate() {
        if let segue = self.segue {
            self.performSegue(withIdentifier: segue, sender: nil)
        }
    }
    
}

extension FormViewController: CheckFormTableViewCellDelegate {
    
    func removeCEll(show:Int, check:Bool, row:Int) {
        
        let newCell = self.objListCell!.filter({ $0.id! != show })
        self.total = newCell.count
        self.objListCell = newCell
        let indexPath = IndexPath(row: 2, section: 0)
        self.tbView.deleteRows(at: [indexPath], with: .automatic)
        let pah = IndexPath(item: 0, section: 0)
        self.tbView.reloadRows(at: [pah], with: .automatic)
        
    }
    
    func showCELL(check:Bool, row:Int) {
        if let listAdd = self.objListCellAdd {
            self.check = check
            self.total = listAdd.count
            self.objListCell = listAdd
            let indexPath = IndexPath(row: 2, section: 0)
            self.tbView.insertRows(at: [indexPath], with: .automatic)
            let path = IndexPath(item: 0, section: 0)
            self.tbView.reloadRows(at: [path], with: .automatic)
        }
    }
    
}
