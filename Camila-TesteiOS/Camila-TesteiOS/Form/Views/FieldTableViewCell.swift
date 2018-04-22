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
    fileprivate var line: UIView?
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
        
        createLine()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        //line
        validateField()
    }
    
    func createLine(){
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.lightGray
        contentView.addSubview(separatorView)
        line = separatorView
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        
        separatorView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        separatorView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        separatorView.widthAnchor.constraint(equalTo: (textField?.widthAnchor)!).isActive = true
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
            line?.backgroundColor = UIColor.gray
        }else if valid {
            line?.backgroundColor = UIColor.app.CorrectInput
        }else{
            line?.backgroundColor = UIColor.app.MainColor
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
