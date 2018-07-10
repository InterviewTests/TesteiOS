//
//  Seeds.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

struct Seeds {
    struct Cells {
        static let text = Cell(id: 1, type: 2, message: "Olá, primeiro se apresente com o seu nome:", typefield: nil, hidden: false, topSpacing: 60.0, show: nil, required: false)
        static let fieldText = Cell(id: 2, type: 1, message: "Nome Completo", typefield: 1, hidden: false, topSpacing: 35.0, show: nil, required: true)
        static let fieldPhone = Cell(id: 6, type: 1, message: "Telefone", typefield: 2, hidden: false, topSpacing: 10.0, show: nil, required: true)
        static let fieldEmail = Cell(id: 4, type: 1, message: "Email", typefield: 3, hidden: true, topSpacing: 35.0, show: nil, required: true)
        static let checkbox = Cell(id: 3, type: 4, message: "Gostaria de cadastrar meu email", typefield: nil, hidden: false, topSpacing: 35.0, show: 4, required: false)
        static let button = Cell(id: 7, type: 5, message: "Enviar", typefield: nil, hidden: false, topSpacing: 10.0, show: nil, required: true)
    }
    
    struct Funds {
        static let month = Month(fund: 0.3, cdi: 0.3)
        static let year = Year(fund: 13.01, cdi: 12.08)
        static let twelveMonths = TwelveMonths(fund: 17.9, cdi: 17.6)
        static let moreInfo = MoreInfo(month: month, year: year, twelveMonths: twelveMonths)
        
        static let info: [Info] = [Info(name: "Taxa de administração", data: "0,50%"),
                                   Info(name: "Aplicação inicial", data: "R$ 10.000,00"),
                                   Info(name: "Movimentação mínima", data: "R$ 1.000,00"),
                                   Info(name: "Saldo mínimo", data: "R$ 5.000,00"),
                                   Info(name: "Resgate (valor bruto)", data: "D+0"),
                                   Info(name: "Cota (valor bruto)", data: "D+1"),
                                   Info(name: "Pagamento (valor bruto)", data: "D+2")]
        
        static let downInfo: [Info] = [Info(name: "Essenciais", data: nil),
                                       Info(name: "Desempenho", data: nil),
                                       Info(name: "Complementares", data: nil),
                                       Info(name: "Regulamento", data: nil),
                                       Info(name: "Adesão", data: nil)]
        
        static let fund = Fund(title: "Fundos de investimento", fundName: "Vinci Valorem FI Multimercado", whatIs: "O que é?", definition: "O Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos.", riskTitle: "Grau de risco do investimento", risk: 4, infoTitle: "Mais informações sobre o investimento", moreInfo: moreInfo, info: info, downInfo: downInfo)
    }
}
