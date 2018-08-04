//
//  FormDefaultCell.swift
//  TesteIOS
//
//  Created by Andre Lucas Ota on 04/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

typealias FormDefaultCell = UITableViewCell & FormDefaultCellProtocol

protocol FormDefaultCellProtocol where Self: UITableViewCell {
    func setCell(cell: Form.FetchCells.ViewModel.DisplayedCell)
}
