//
//  FundModel.swift
//  TesteSantander
//
//  Created by Marcel Mendes Filho on 06/05/2018.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

class FundModel: NSObject {
    
    // espelho dos campos JSON
    var title: String?
    var fundName: String?
    var whatIs: String?
    var definition: String?
    var riskTitle: String?
    var risk: Int?
    var infoTitle: String?
    
    // estrutura de dados para armazenar o desempenho do fundo
    struct FundPerformance
    {
        var title: String?
        var fund: Double?
        var CDI: Double?
    }

    // variável que armazenará o desempenho do fundo
    var fundPerformance = FundPerformance()

    // array que armazenará os desempenhos do fundo
    var moreInfo = [FundPerformance]()

    // estrutura de dados para armazenar informações adicionais
    struct AdditionalInfo
    {
        var name: String?
        var data: String?
    }
    
    // variável que armazenará informação adicional
    var additionalInfo = AdditionalInfo()

    // arrays que armazenará toda as entradas de informações adicionais - ver estrutura JSON
    var info = [AdditionalInfo]()
    var downInfo = [AdditionalInfo]()
}
