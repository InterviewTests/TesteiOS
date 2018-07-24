//
//  FieldCell.swift
//  FinForm
//
//  Created by Gustavo Luís Soré on 22/07/2018.
//  Copyright © 2018 Sore. All rights reserved.
//

import UIKit

typealias ValidationFieldRuleCompletion = (String) -> Bool
typealias FieldCellUpdateValueCompletion = (String,Int) -> Void
typealias FieldCellCanUpdateValueCompletion = (String,String) -> Bool

class FieldCell: UITableViewCell {
    
    @IBOutlet var selectedTitleLabel: UILabel!
    @IBOutlet var unselectedTitleLabel: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var cleanButton: UIButton!
    @IBOutlet var lineView: UIView!
    @IBOutlet var topConstraint: NSLayoutConstraint!
    
    var cellMetaData:CellMetaData!
    var index:Int = 0
    
    static let identifier:String = "FieldCell"
    static var nib:UINib{
        let nibInfo = UINib(nibName: "FieldCell", bundle: nil)
        return nibInfo
    }
    
    var validationRuleCompletion:ValidationFieldRuleCompletion?
    var updateValueCompletion:FieldCellUpdateValueCompletion?
    var canUpdateValueCompletion:FieldCellCanUpdateValueCompletion?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func cleanAction(_ sender: Any) {
        textField.text = ""
        setDefaultState()
        cleanButton.isHidden = true
    }
    
    func populate(cellMetaData:CellMetaData,index:Int){
        self.cellMetaData = cellMetaData
        self.index = index
        
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
            var updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            
            if validationRuleCompletion != nil{
                if validationRuleCompletion!(updatedText){
                    setSuccessState()
                } else{
                    setFailureState()
                }
            }
            
            if updatedText.isEmpty{
                cleanButton.isHidden = true
                setDefaultState()
            } else{
                cleanButton.isHidden = false
            }
            
            if canUpdateValueCompletion != nil{
                if canUpdateValueCompletion!(string,updatedText) == false{
                    if text.isEmpty{
                        cleanButton.isHidden = true
                    }
                    return false
                }
            }
            
            if let typeField = cellMetaData.cell?.typeField{
                if typeField == .telNumber{
                    updatedText = FormWorker().telNumberMask(numbers: updatedText)
                    self.textField.delegate = nil
                    self.textField.text = updatedText
                    self.textField.delegate = self
                    return false
                }
            }
            
            cellMetaData.textValue = updatedText
            self.updateValueCompletion?(cellMetaData.textValue,self.index)
        }
        
        return true
    }
}
