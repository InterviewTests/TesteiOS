//
//  CusomTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 22/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class CusomTableViewCell: UITableViewCell {
    deinit {
        for i in subviews{
            i.removeFromSuperview()
        }
    }
}
