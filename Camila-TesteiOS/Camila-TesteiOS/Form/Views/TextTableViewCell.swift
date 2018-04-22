//
//  TextTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class TextTableViewCell: CusomTableViewCell, CellProtocol {
    var uniqueKey: String{
        return "Text\(cell?.id ?? 0)"
    }
    
    var cell: Cell?
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var topSpacing: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup() {
        clipsToBounds = true
        guard let cell = cell else {
            return
        }
        label.text = cell.message
        topSpacing?.constant = CGFloat(cell.topSpacing)
    }
    
}
