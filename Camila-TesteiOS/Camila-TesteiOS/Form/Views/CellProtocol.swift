//
//  CellProtocol.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

protocol CellProtocol where Self: UITableViewCell {
    weak var topSpacing: NSLayoutConstraint? {get set}
    weak var cell: Cell? {get set}
    func setup()
    
}
