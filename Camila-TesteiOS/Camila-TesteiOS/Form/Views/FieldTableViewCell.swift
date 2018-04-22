//
//  FieldTableViewCell.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 21/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class FieldTableViewCell: CusomTableViewCell, CellProtocol {
    var uniqueKey: String{
        return "Field\(cell?.id ?? 0)"
    }
    
    var cell: Cell?
    @IBOutlet weak var label: UILabel?
    @IBOutlet weak var textField: UITextField?
    @IBOutlet weak var topSpacing: NSLayoutConstraint?
    fileprivate var line: CAShapeLayer?
    public var valid: Bool = false
    
    var fieldChanged: ((Bool)->())?
    
    var lastState: Any?{
        set{
            UserDefaults().set(newValue, forKey: uniqueKey)
        }
        get{
            return UserDefaults().value(forKey: uniqueKey)
        }
    }
    
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
        
        self.backgroundColor = UIColor.clear
        
        textField?.textContentType = cell.typeField.textContentType
        textField?.keyboardType = cell.typeField.keyboardType
        textField?.text = lastState as? String
        textField?.font = AppFont.defaultFonts.text
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //line
        guard let y = textField?.frame.origin.y, let x = textField?.frame.origin.x, let width = textField?.frame.size.width, let hight = textField?.frame.size.height else {
            return
        }
        line = createLine(fromPoint: CGPoint(x: x, y: y + hight + 3), toPoint: CGPoint(x: x + width, y: y + hight + 3))
        self.layer.addSublayer(line!)
        validateField()
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

    static var input: String?
    @IBAction func editDidChange(_ sender: UITextField) {
        formatField()
        validateField()
        
        lastState = sender.text
    }
    
    func validateField() {
        guard let txt = textField?.text else {
            return
        }
        
        valid = TypefieldValidator(cell?.typeField).validate(txt)
        
        if txt.isEmpty  {
            line?.strokeColor = UIColor.gray.cgColor
        }else if valid {
            line?.strokeColor = UIColor.app.CorrectInput.cgColor
        }else{
            line?.strokeColor = UIColor.app.MainColor.cgColor
        }
        
        fieldChanged?(valid)
    }
    
    func formatField(){
        //FORMAT
        if cell?.typeField == TypeField.telNumber{
            let text = textField?.text?.digitsOnly() ?? ""
            textField?.text = TypefieldFormater.format(phone: text)
        }
    }
    
}
