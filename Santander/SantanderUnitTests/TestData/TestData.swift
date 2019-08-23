//
//  TestData.swift
//  SantanderUnitTests
//
//  Created by Orlando Amorim on 22/08/19.
//

import Foundation
@testable import Santander

struct TestData {
    struct ContactForm {
        static let emailCell = FormCell(id: 2, type: .field, message: "Email", fieldType: .email, isHidden: true, topSpacing: 35.0, fieldToPresent: nil, isRequired: true)
    }
    
    struct Investment {
        static let moreInfo = FundsScreen.MoreInfo(month: FundsScreen.MoreInfo.Percentages(fund: 0.3, cdi: 0.3),
                                                    year: FundsScreen.MoreInfo.Percentages(fund: 13.01, cdi: 12.08),
                                                    twelveMonths: FundsScreen.MoreInfo.Percentages(fund: 17.9, cdi: 17.6))
        
        static let info = [FundsScreen.Info(name: "Taxa de administração", data: "0,50%"),
                           FundsScreen.Info(name: "Aplicação inicial", data: "R$ 10.000,00"),
                           FundsScreen.Info(name: "Movimentação mínima", data: "R$ 1.000,00"),
                           FundsScreen.Info(name: "Saldo mínimo", data: "R$ 5.000,00"),
                           FundsScreen.Info(name: "Resgate (valor bruto)", data: "D+0"),
                           FundsScreen.Info(name: "Cota (valor bruto)", data: "D+1"),
                           FundsScreen.Info(name: "Pagamento (valor bruto)", data: "D+2")]
        
        static let downInfo = [FundsScreen.DownInfo(name: "Essenciais", data: nil),
                               FundsScreen.DownInfo(name: "Desempenho", data: nil),
                               FundsScreen.DownInfo(name: "Complementares", data: nil),
                               FundsScreen.DownInfo(name: "Regulamento", data: nil),
                               FundsScreen.DownInfo(name: "Adesão", data: nil)]
        
        static let screen = FundsScreen(title: "Fundos de investimento",
                                        fundName: "Vinci Valorem FI Multimercado",
                                        whatIs: "O que é?",
                                        definition: "O Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos.",
                                        riskTitle: "Grau de risco do investimento",
                                        risk: .four,
                                        infoTitle: "Mais informações sobre o investimento",
                                        moreInfo: moreInfo,
                                        info: info,
                                        downInfo: downInfo)
    }
}
