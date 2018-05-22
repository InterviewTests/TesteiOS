//
//  FieldsTableViewCell.swift
//  TesteiOS
//
//  Created by Naville Brasil on 18/05/18.
//  Copyright © 2018 Luan Orlando. All rights reserved.
//

import UIKit
import JMMaskTextField_Swift

class FieldsTableViewCell: UITableViewCell
{
    enum LabelType: Int
    {
        case name = 2
        case email = 4
        case phone = 6
    }
    
    //Outlets
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFields: UITextField!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var topConstraint: NSLayoutConstraint!
    @IBOutlet weak var heigthContraint: NSLayoutConstraint!
    
    //Properties
    var idCell: LabelType?
    
    static let shared = FieldsTableViewCell()
    
    let defaultColor = #colorLiteral(red: 0.8374213576, green: 0.8374213576, blue: 0.8374213576, alpha: 1)
    let grayColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
    let redColor = #colorLiteral(red: 0.968627451, green: 0.2901960784, blue: 0.2823529412, alpha: 1)
    let greenColor = #colorLiteral(red: 0.4980392157, green: 0.7921568627, blue: 0.3254901961, alpha: 1)
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        self.textFields.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)
    }
}

//MARk: -
extension FieldsTableViewCell: UITextFieldDelegate
{
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
        self.labelTitle.font = UIFont(name: self.labelTitle.font.fontName, size: 22)
        guard let idCell = self.idCell else {return}
        switch idCell
        {
            case .name:
                self.viewLine.backgroundColor = self.grayColor
                print("GrayColor")
            case .email:
                self.viewLine.backgroundColor = self.redColor
                print("RedColor")
            case .phone:
                self.viewLine.backgroundColor = self.greenColor
                print("GreenColor")
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField)
    {
        self.labelTitle.font = UIFont(name: self.labelTitle.font.fontName, size: 16)
        
        if self.textFields.text != ""
        {
            guard let idCell = self.idCell else {return}
            switch idCell
            {
                case .name:
                    self.viewLine.backgroundColor = self.grayColor
                    if let nameTemp = self.textFields.text
                    {
                        UserDefaults.standard.set(nameTemp, forKey: "Name")
                        print(self.textFields.text!)
                    }
                case .email:
                    self.viewLine.backgroundColor = self.redColor
                    if let emailTemp = self.textFields.text
                    {
                        UserDefaults.standard.set(emailTemp, forKey: "Email")
                        print(self.textFields.text!)
                    }
                case .phone:
                    self.viewLine.backgroundColor = self.greenColor
                    if let phoneTemp = self.textFields.text
                    {
                        UserDefaults.standard.set(phoneTemp, forKey: "Phone")
                        print(self.textFields.text!)
                    }
            }
            
        }
        else
        {
            self.viewLine.backgroundColor = self.defaultColor
        }
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool
    {
        guard let idCell = self.idCell else {return false}
        switch idCell
        {
            case .name:
                if range.length == 1
                {}
                else
                {
                    if range.location > 100
                    {
                        return false
                    }
                }
            case .email:
                if range.length == 1
                {}
                else
                {
                    if range.location > 50
                    {
                        return false
                    }
                }
            case .phone:
                if range.length == 1
                {
                    print("Removing characteres")
                }
                else
                {
                    if range.location <= 13
                    {
                        let maskTel = JMStringMask(mask: "(00) 0000-0000")
                        let mask = maskTel.mask(string: self.textFields.text)
                        self.textFields.text = mask
                        print(self.textFields.text!)
                        print("mask", range.location)
                        
                    }
                    else if range.location == 14
                    {
                        let text = self.textFields.text?.replacingOccurrences(of: " ", with: "").replacingOccurrences(of: "-", with: "")
                        
                        let maskCel = JMStringMask(mask: "(00) 0 0000-0000")
                        let mask = maskCel.mask(string: text!)
                        self.textFields.text = mask
                        print(self.textFields.text!)
                        print("mask2", range.location)
                    }
                    else if range.location > 15
                    {
                        return false
                    }
                }
        }
        
        return true
    }
}
