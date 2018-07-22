//
//  FieldCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

typealias ValidationFieldRuleCompletion = (String,TypeField) -> Bool

class FieldCell: UITableViewCell {
    
    @IBOutlet var selectedTitleLabel: UILabel!
    @IBOutlet var unselectedTitleLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var cleanButton: UIButton!
    @IBOutlet var lineView: UIView!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    var cellMetaData:CellMetaData!
    
    static let identifier:String = "FieldCell"
    
    var validationRuleCompletion:ValidationFieldRuleCompletion?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func cleanAction(_ sender: Any) {
        textField.text = ""
        setDefaultState()
        cleanButton.isHidden = true
    }
    
    func populate(cellMetaData:CellMetaData){
        self.cellMetaData = cellMetaData
        
        if let cell = cellMetaData.cell{
            if let topSpacing = cell.topSpacing{
               topConstraint.constant = CGFloat(topSpacing)
            }
            if let message = cell.message{
                selectedTitleLabel.text = message
                unselectedTitleLabel.text = message
            }
        }
        
        textField.delegate = self
        cleanButton.layer.cornerRadius = cleanButton.frame.width / 2
        cleanButton.layer.masksToBounds = true
    }
    
    private func setSelectedTitleStyle(){
        if unselectedTitleLabel.isHidden{
            return
        }
        let titleCopy = unselectedTitleLabel.copyLabel()
        self.addSubview(titleCopy)
        unselectedTitleLabel.isHidden = true
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.lineView.backgroundColor = UIColor().formGray
                titleCopy.frame = self.selectedTitleLabel.frame
                titleCopy.font = self.selectedTitleLabel.font
            }) { (success) in
                self.selectedTitleLabel.isHidden = false
                titleCopy.removeFromSuperview()
            }
        }
    }
    
    private func setUnselectedTitleStyle(){
        if selectedTitleLabel.isHidden{
            return
        }
        let titleCopy = selectedTitleLabel.copyLabel()
        self.addSubview(titleCopy)
        selectedTitleLabel.isHidden = true
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.3, animations: {
                self.lineView.backgroundColor = UIColor().formLightGray
                titleCopy.frame = self.unselectedTitleLabel.frame
                titleCopy.font = self.unselectedTitleLabel.font
            }) { (success) in
                self.unselectedTitleLabel.isHidden = false
                titleCopy.removeFromSuperview()
            }
        }
    }
    
    private func setDefaultState(){
        if cellMetaData.fieldState == .Default{
            return
        }
        let lineCopy = UIView.init(frame: lineView.frame)
        lineCopy.backgroundColor = lineView.backgroundColor
        self.addSubview(lineCopy)
        lineView.backgroundColor = UIColor().formLightGray
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                lineCopy.frame = CGRect(x:lineCopy.frame.origin.x,
                                        y:lineCopy.frame.origin.y,
                                        width:0,
                                        height:lineCopy.frame.height)
            }) { (success) in
                lineCopy.removeFromSuperview()
            }
        }
        cellMetaData.fieldState = .Default
    }
    
    private func setSuccessState(){
        if cellMetaData.fieldState == .Success{
            return
        }
        let lineCopy = UIView.init(frame: CGRect(x:lineView.frame.origin.x,
                                                 y:lineView.frame.origin.y,
                                                 width:0,
                                                 height:lineView.frame.height))
        lineCopy.backgroundColor = UIColor().greenLine
        self.addSubview(lineCopy)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                lineCopy.frame = self.lineView.frame
            }) { (success) in
                self.lineView.backgroundColor = UIColor().greenLine
                lineCopy.removeFromSuperview()
            }
        }
        cellMetaData.fieldState = .Success
    }
    
    private func setFailureState(){
        if cellMetaData.fieldState == .Failure{
            return
        }
        let lineCopy = UIView.init(frame: CGRect(x:lineView.frame.origin.x,
                                                 y:lineView.frame.origin.y,
                                                 width:0,
                                                 height:lineView.frame.height))
        lineCopy.backgroundColor = UIColor().redLine
        self.addSubview(lineCopy)
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.5, animations: {
                lineCopy.frame = self.lineView.frame
            }) { (success) in
                self.lineView.backgroundColor = UIColor().redLine
                lineCopy.removeFromSuperview()
            }
        }
        cellMetaData.fieldState = .Failure
    }
    
}

extension FieldCell:UITextFieldDelegate{
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        setSelectedTitleStyle()
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if let text = textField.text{
            if text.isEmpty{
                setUnselectedTitleStyle()
                setDefaultState()
            }
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            
            if validationRuleCompletion != nil{
                if let typeField = cellMetaData.cell?.typeField{
                    if validationRuleCompletion!(updatedText,typeField){
                        setSuccessState()
                    } else{
                        setFailureState()
                    }
                }
            }
            
            if updatedText.isEmpty{
                cleanButton.isHidden = true
                setDefaultState()
            } else{
                cleanButton.isHidden = false
            }
            
            cellMetaData.textValue = updatedText
        }
        
        return true
    }
}
