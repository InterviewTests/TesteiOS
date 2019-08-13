//
//  PhoneFloatLabelRow.swift
//  Santander
//
//  Created by Orlando Amorim on 13/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Eureka

public class PhoneFloatLabelCell : _FloatLabelCell<String>, CellType {
    
    required public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func setup() {
        super.setup()
        customMaskType = .phone
        textField?.keyboardType = .phonePad
    }
}

public final class PhoneFloatLabelRow: FloatFieldRow<PhoneFloatLabelCell>, RowType {
    public required init(tag: String?) {
        super.init(tag: tag)
    }
}
