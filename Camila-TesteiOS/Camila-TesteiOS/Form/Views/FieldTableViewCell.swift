//
//  FieldTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class FieldTableViewCell: UITableViewCell, CellProtocol {
    var cell: Cell?
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var topSpacing: NSLayoutConstraint?
    fileprivate var line: CAShapeLayer?
    
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
        label?.text = cell.message
        topSpacing?.constant = CGFloat(cell.topSpacing)
        
//        self.layer.borderColor = UIColor.green.cgColor
        self.backgroundColor = UIColor.clear
        
        textField?.textContentType = cell.typeField.textContentType
        textField?.keyboardType = cell.typeField.keyboardType
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //line
        guard let y = textField?.frame.origin.y, let x = textField?.frame.origin.x, let width = textField?.frame.size.width, let hight = textField?.frame.size.height else {
            return
        }
        line = createLine(fromPoint: CGPoint(x: x, y: y + hight ), toPoint: CGPoint(x: x + width, y: y + hight))
        self.layer.addSublayer(line!)
    }
    
    func createLine(fromPoint start: CGPoint, toPoint end:CGPoint) -> CAShapeLayer{
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.gray.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        return line
    }
   
    @IBAction func editDidChange(_ sender: UITextField) {
        let color = getColorLineAccordingTo(forString: sender.text, withValidator: TypefieldValidator(cell?.typeField))
        line?.strokeColor = color
    }
    
    fileprivate func getColorLineAccordingTo(forString str: String?, withValidator validator: TypefieldValidator) -> CGColor{
        guard let str = str, !str.isEmpty else{
            return UIColor.gray.cgColor
        }
        
        if validator.validate(str) {
            return UIColor.app.CorrectInput.cgColor
        }else{
            return UIColor.app.MainColor.cgColor
        }
        
    }
    
}
