//
//  ListCellViewController.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation
import UIKit

protocol ListCellViewControllerInput
{
    
}

protocol ListCellViewControllerOutput
{
    func fetchItems()
}

// Tableview
extension ListCellViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let textFieldCell = tableView.dequeueReusableCell(withIdentifier: "text_field_cell", for: indexPath) as! CustomTextFieldCell
        
        return textFieldCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listCell.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

class ListCellViewController: UIViewController, ListCellViewControllerInput, UITableViewDelegate {
    
    var output: ListCellViewControllerOutput!
    var router: ListCellRouter!
    
    // Lista de itens
    var listCell : [Cell] = [Cell]()
    
    // UI
    @IBOutlet weak var tblForm: UITableView!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ListCellConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        // Delegate
        self.tblForm.delegate = self
        self.tblForm.dataSource = self
        
        // Registrar as cells
        let nibTextFieldCell = UINib(nibName: "CustomTextFieldCell", bundle: nil)
        self.tblForm.register(nibTextFieldCell, forCellReuseIdentifier: "text_field_cell")
        
        output.fetchItems()
    }
    
    // Métodos de callback das requisições
    func successFetchedItems(response: ListCell.Fetch.Response) {
        listCell = response.cells
        // Recarregar os dados da tabela
        self.tblForm.reloadData()
    }
    
    func errorFetchingItems(response: ListCell.Fetch.Response) {
        //
    }
}
