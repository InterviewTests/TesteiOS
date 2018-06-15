//
//  FormFactory.swift
//  TesteIOS
//
//  Created by Sidney Silva on 12/06/2018.
//  Copyright © 2018 Sakura Soft. All rights reserved.
//

import UIKit

class FormFactory: NSObject {
    
    static func registerCell(tableView: UITableView) {
        let textFieldNib = UINib(nibName: NibName.textfieldNib, bundle: nil)
        let labelNib = UINib(nibName: NibName.labelNib, bundle: nil)
        let checkButtonNib = UINib(nibName: NibName.checkButtonNib, bundle: nil)
        let buttonNib = UINib(nibName: NibName.buttonNib, bundle: nil)
        
        tableView.register(textFieldNib, forCellReuseIdentifier: CellIdentifier.textFieldCell)
        tableView.register(buttonNib, forCellReuseIdentifier: CellIdentifier.buttonCell)
        tableView.register(labelNib, forCellReuseIdentifier: CellIdentifier.labelCell)
        tableView.register(checkButtonNib, forCellReuseIdentifier: CellIdentifier.checkButtonCell)
    }
    
    static func configureTableViewCell(tableView: UITableView, indexPath: IndexPath, cell: Cell, delegate: ContactViewController) -> UITableViewCell {
        switch cell.type! {
        case .field:
            let textCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.textFieldCell, for: indexPath) as! TextFieldTableViewCell
            textCell.formCell = cell
            textCell.txtField.keyboardType = TextFieldUtils.textFieldKeyboardType(type: cell.typefield!)
            textCell.configureLabel()
            return textCell
        case .text:
            let labelCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.labelCell, for: indexPath) as! LabelTableViewCell
            labelCell.configureLabel(formCell: cell)
            return labelCell
        case .checkbox:
            let checkCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.checkButtonCell, for: indexPath) as! CheckButtonTableViewCell
            checkCell.delegate = delegate
            checkCell.formCell = cell
            checkCell.configureCell()
            return checkCell
        case .send:
            let buttonCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.buttonCell, for: indexPath) as! ButtonTableViewCell
            buttonCell.configureCell(formCell: cell)
            buttonCell.delegate = delegate
            return buttonCell
        case .image:
            let imageCell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier.imageCell, for: indexPath)
            return imageCell
        }
    }
    
}
