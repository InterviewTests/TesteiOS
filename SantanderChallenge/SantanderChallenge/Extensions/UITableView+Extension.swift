//
// UITableView+Extension.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 06/07/19.
//

import UIKit

extension UITableView {
    func registerCellNib(cellClass: UITableViewCell.Type) {
        let name = cellClass.reusableIdentifier
        let nib = UINib(nibName: name, bundle: nil)
        self.register(nib, forCellReuseIdentifier: name)
    }
    
    func registerCellsNib(cellsClass: [UITableViewCell.Type]) {
        cellsClass.forEach {
            registerCellNib(cellClass: $0)
        }
    }
    
    func dequeueReusableCell<CellType>(cellType: UITableViewCell.Type) -> CellType? {
        return dequeueReusableCell(withIdentifier: cellType.reusableIdentifier) as? CellType
    }
}

