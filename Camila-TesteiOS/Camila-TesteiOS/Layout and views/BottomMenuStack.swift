//
//  BottomMenuStack.swift
//  Camila-TesteiOS
//
//  Created by camila oliveira on 20/04/18.
//  Copyright © 2018 Aliamcami. All rights reserved.
//

import UIKit

class BottomMenuStack: UIStackView {
    
    func setContatoOn(_ state: Bool){
        ContatoButton?.isUserInteractionEnabled = !state
        InvestimentosButton?.isUserInteractionEnabled = state
    }
    
    func setInvestimentoOn(_ state: Bool) {
        setContatoOn(!state)
    }

    
    @IBOutlet weak var ContatoButton: UIButton?
    @IBOutlet weak var InvestimentosButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
}
