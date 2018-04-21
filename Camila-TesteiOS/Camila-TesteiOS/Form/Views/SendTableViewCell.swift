//
//  SendTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class SendTableViewCell: UITableViewCell, CellProtocol {
    var cell: Cell?
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var topSpacing: NSLayoutConstraint?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        button.layer.cornerRadius = 25
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
        button.setTitle(cell.message, for: .normal)
        topSpacing?.constant = CGFloat(cell.topSpacing)
    }
    
}
