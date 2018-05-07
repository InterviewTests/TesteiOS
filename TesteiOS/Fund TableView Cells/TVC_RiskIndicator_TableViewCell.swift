//
//  TVC_RiskIndicator_TableViewCell.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 06/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class TVC_RiskIndicator_TableViewCell: UITableViewCell {

    @IBOutlet weak var Risk_0: UIImageView!
    @IBOutlet weak var Risk_1: UIImageView!
    @IBOutlet weak var Risk_2: UIImageView!
    @IBOutlet weak var Risk_3: UIImageView!
    @IBOutlet weak var Risk_4: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // zera o conteúdo das imagens
        Risk_0.image = nil
        Risk_1.image = nil
        Risk_2.image = nil
        Risk_3.image = nil
        Risk_4.image = nil

    }
    
    func setRiskIndicator( index: Int)
    {
        // decide onde colocar o indicador de risco
        switch index
        {
        case 1:
            Risk_0.image = #imageLiteral(resourceName: "Icone Indicador Grau Risco")
        case 2:
            Risk_1.image = #imageLiteral(resourceName: "Icone Indicador Grau Risco")
        case 3:
            Risk_2.image = #imageLiteral(resourceName: "Icone Indicador Grau Risco")
        case 4:
            Risk_3.image = #imageLiteral(resourceName: "Icone Indicador Grau Risco")
        case 5:
            Risk_4.image = #imageLiteral(resourceName: "Icone Indicador Grau Risco")
        default:
            Risk_4.image = #imageLiteral(resourceName: "Icone Indicador Grau Risco")
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
