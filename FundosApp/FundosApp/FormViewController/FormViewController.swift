//
//  FormViewController.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 09/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class FormViewController: UIViewController {
    
    @IBOutlet weak var tableViewForm: UITableView!
    var formPresenter:FormPresender!
    override func viewDidLoad() {
        super.viewDidLoad()
        formPresenter = FormPresender(service: FormServiceImp(), view: self)
        formPresenter.loadForm()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func investimentButtonTapped(_ sender: CustomButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}

extension FormViewController:UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return formPresenter.numberOfItems
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellForm = formPresenter.getCellForIndex(index: indexPath.row)
        switch cellForm.type {
        case .text:
            guard let titleFormTableViewCell = tableView.dequeueReusableCell(withIdentifier: "TitleFormTableViewCell") as? TitleFormTableViewCell else {
                fatalError("Erro ao criar celula TitleFormTableViewCell")
                
            }
            titleFormTableViewCell.setup(with: TitleTableDataViewCell(with: cellForm))
            return titleFormTableViewCell
        case .field:
            guard let formFieldTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FormFieldTableViewCell") as? FormFieldTableViewCell else {
                fatalError("Erro ao criar celula FormFieldTableViewCell")
                
            }
            formFieldTableViewCell.setup(with: FormTableDataViewCell(with: cellForm))
            return formFieldTableViewCell
            
        case .checkbox:
            guard let formCheckTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FormCheckTableViewCell") as? FormCheckTableViewCell else {
                fatalError("Erro ao criar celula FormCheckTableViewCell")
                
            }
            formCheckTableViewCell.setup(with: FormCheckTableDataViewCell(with: cellForm))
            return formCheckTableViewCell
        case .send:
            guard let formButtonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "FormButtonTableViewCell") as? FormButtonTableViewCell else {
                fatalError("Erro ao criar celula FormButtonTableViewCell")
                
            }
            formButtonTableViewCell.delegate = self

            return formButtonTableViewCell
            
        default:
            let cell = UITableViewCell()
            cell.textLabel?.text = "teste"
            return cell
        }

    

    }
    
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellForm = formPresenter.getCellForIndex(index: indexPath.row)

        let min = 50 + CGFloat(cellForm.topSpacing)
        let max = 65 + CGFloat(cellForm.topSpacing)
        let height = ((tableView.frame.height - 44) / CGFloat(1)) + CGFloat(cellForm.topSpacing)

        let h = CGFloat.minimum(max, height)
        return CGFloat.maximum(h, min)
        return UITableViewAutomaticDimension
    }
}

extension FormViewController:UITableViewDelegate,DelegateSegue{
    func performSegue(value: String) {
        performSegue(withIdentifier: value, sender: nil)

    }
}

extension FormViewController:FormProtocol{
    func updateWithLoadedFormCells(){
        TitleFormTableViewCell.register(to: tableViewForm)
        FormFieldTableViewCell.register(to: tableViewForm)
        FormCheckTableViewCell.register(to: tableViewForm)
        FormButtonTableViewCell.register(to: tableViewForm)


        

        tableViewForm.delegate = self
        tableViewForm.dataSource = self
        tableViewForm.reloadData()
    }
    
    
}
