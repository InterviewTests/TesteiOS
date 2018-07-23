//
//  ViewController.swift
//  FinForm
//
//  Created by Gustavo on 20/07/18.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        tableView.delegate = self
        tableView.dataSource = self
        let nib = UINib(nibName: "FieldCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: FieldCell.identifier)
        let nibText = UINib(nibName: "TextCell", bundle: nil)
        tableView.register(nibText, forCellReuseIdentifier: TextCell.identifier)
        let nibImage = UINib(nibName: "ImageCell", bundle: nil)
        tableView.register(nibImage, forCellReuseIdentifier: ImageCell.identifier)
        let nibCheckBox = UINib(nibName: "CheckBoxCell", bundle: nil)
        tableView.register(nibCheckBox, forCellReuseIdentifier: CheckBoxCell.identifier)
        let nibButton = UINib(nibName: "ButtonCell", bundle: nil)
        tableView.register(nibButton, forCellReuseIdentifier: ButtonCell.identifier)
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 70
        
        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cellMetaData:CellMetaData = CellMetaData()
        cellMetaData.fieldState = .Default
        
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: TextCell.identifier, for: indexPath) as! TextCell
            let cellModel = Cell.init(id: 0, type: Type.text, message: "Contato", typeField: TypeField.text, topSpacing: 60.0, show: 1, required: false)
            cellMetaData.cell = cellModel
            cell.selectionStyle = .none
            cell.populate(cellMetaData: cellMetaData)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ImageCell.identifier, for: indexPath) as! ImageCell
            let cellModel = Cell.init(id: 1, type: Type.image, message: "https://dicadehoje7.com/wp-content/uploads/2017/10/resultados-santander-capa.jpg", typeField: TypeField.text, topSpacing: 35.0, show: 1, required: false)
            cellMetaData.cell = cellModel
            cell.selectionStyle = .none
            cell.populate(cellMetaData: cellMetaData)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier, for: indexPath) as! FieldCell
            
            let cellModel = Cell.init(id: 2, type: Type.field, message: "Nome", typeField: TypeField.text, topSpacing: 35.0, show: 1, required: true)
            cellMetaData.cell = cellModel
            
            cell.selectionStyle = .none
            cell.populate(cellMetaData: cellMetaData)
            //        cell.validationRuleCompletion = { text,type in
            //            if text == "Teste"{
            //                return true
            //            } else{
            //                return false
            //            }
        //        }
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: CheckBoxCell.identifier, for: indexPath) as! CheckBoxCell
            let cellModel = Cell.init(id: 0, type: Type.checkbox, message: "Gostaria de cadastrar meu email", typeField: TypeField.text, topSpacing: 35.0, show: 4, required: false)
            cellMetaData.cell = cellModel
            cell.selectionStyle = .none
            cell.populate(cellMetaData: cellMetaData)
            cell.selectionCompletion = {selected,cellMetaData in
                print("Selected: \(selected)")
                print("Show: \(cellMetaData.cell?.show)")
            }
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: ButtonCell.identifier, for: indexPath) as! ButtonCell
            let cellModel = Cell.init(id: 0, type: Type.send, message: "Enviar", typeField: TypeField.text, topSpacing: 10.0, show: 4, required: false)
            cellMetaData.cell = cellModel
            cell.selectionStyle = .none
            cell.populate(cellMetaData: cellMetaData)
            cell.selectionCompletion = {metaData in
                print("Button: \(metaData.cell?.message)")
            }
            return cell
        default:
            break
        }
        
        return UITableViewCell();
    }
    
}
