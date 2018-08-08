//
//  FormDefaultCell.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

typealias FormDefaultCell = UITableViewCell & FormDefaultCellProtocol

protocol FormDefaultCellProtocol: NSObjectProtocol {
    var delegate: FormDefaultCellDelegate? { get set }
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell)
}

protocol FormDefaultCellDelegate {
    func sendButtonTouched()
}
