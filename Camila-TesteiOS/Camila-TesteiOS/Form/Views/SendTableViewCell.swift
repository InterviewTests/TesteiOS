//
//  SendTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class SendTableViewCell: CusomTableViewCell, CellProtocol {
    var uniqueKey: String{
        return "Send\(cell?.id ?? 0)"
    }
    
    var cell: Cell?
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var topSpacing: NSLayoutConstraint?
    var action: (()->())?
    
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
        button.setTitle(cell.message, for: .normal)
        topSpacing?.constant = CGFloat(cell.topSpacing)
        button.titleLabel?.font = AppFont.defaultFonts.text
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        action?()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        button.layer.cornerRadius = button.layer.frame.height * 0.5
    }
    
    
}
