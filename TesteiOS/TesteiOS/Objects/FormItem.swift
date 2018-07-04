//
//  FormItem.swift
//  TesteiOS
//
//  Created by Carolina Bonturi on 7/4/18.
//  Copyright © 2018 Carolina Bonturi. All rights reserved.
//

import UIKit

class FormItem {
    
    var id = ""
    var label = UILabel()
    var textField = UITextField()
    var line = Line()
    
    
    init(id: String, label: UILabel, textField: UITextField, line: Line) {
        self.id = id
        self.label = label
        self.textField = textField
        self.line = line
    }
    
    
}
