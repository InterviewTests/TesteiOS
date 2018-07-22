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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FieldCell.identifier, for: indexPath) as! FieldCell
        
        var cellMetaData:CellMetaData = CellMetaData()
        cellMetaData.fieldState = .Default
        let cellModel = Cell.init(id: 0, type: Type.field, message: "Nome", typeField: TypeField.text, topSpacing: 35.0, show: 1, required: true)
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
        
        return cell;
    }
    
}
