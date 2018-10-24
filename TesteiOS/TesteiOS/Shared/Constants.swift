//
//  Constants.swift
//  TesteiOS
//
//  Created by Marcel Mendes Filho on 21/10/18.
//  Copyright © 2018 Marcel Mendes Filho. All rights reserved.
//

import UIKit

struct Constants {
    
    static let okButtonText = "Ok"

    struct Form {
        static let title = "Contato"
        static let data = "https://floating-mountain-50292.herokuapp.com/cells.json"
        static let localData = "cells.json"
        static let loadErrorMessage = "Não foi possível carregar o JSON do formulário de contato."
        static let loadErrorTitle = "Erro"
        static let parseError = "Wrong type for Typefield"
        
        struct View{
            static let cellPhoneMask = "(00) 0 0000-0000"
            static let landLinePhoneMask = "(00) 0000-0000"
            static let errorTitle = "Erro"
            static let errorMessage = "Não foi possível carregar o JSON do form de contato."
            static let okButton = "OK"
            static let regularFont = "DINPro-Regular"
            static let warning = "Aviso"
            static let invalidEmailAddress = "Endereço de email não é válido. Verifique."
            static let invalidPhoneNumber = "Número de telefone não é válido. Verifique."
            static let missingData = "Faltou preencher"
            static let emtpyFieldIndicator = "Linha Campo Vazio"
            static let invalidFieldIndicator = "Linha Campo Invalido"
            static let validFieldIndicator = "Linha Campo Valido"
        }
    }
    
    struct Investments{
        static let title = "Investimentos"
        static let data = "https://floating-mountain-50292.herokuapp.com/fund.json"
        static let localData = "fund.json"
        static let shareURL = "https://www.google.com"
        static let loadErrorMessage = "Não foi possível carregar o JSON do fundo de investimento."
        static let loadErrorTitle = "Erro"

        struct View{
            static let month = "Mês"
            static let year = "Ano"
            static let the12months = "12 meses"
            static let fundFormat = "%.2f"
        }
    }
    
    struct Confirmation{
        static let title = "Contato"
        static let subTitle = "Obrigado!"
        static let mainMessage = "Mensagem enviada com sucesso :-)"
        static let buttonText = "Enviar nova mensagem"
    }
    
    static let loadingMessage = "Carregando dados. Aguarde."
    static let vermelhoSantander = "DA0101"
    static let localNotificationKey001 = "com.santander.pf001" // em uso para acionar o display da confirmation view
    static let localNotificationKey002 = "com.santander.pf002" // em uso para acionar o display da form view a partir da confirmation view
    static let emptyURL = "URL do formulário não foi definida"
    static let cannotParseJson = "Erro ao ler JSON"
    static let cannotRetrieveJson = "Erro ao recuperar JSON"

}

// estrutura de dados para armazenar o data entry nos campos
struct DataEntry
{
    var stringData: String?
    var intData: Int?
    var booleanData = false
    var tapGestureRecognizer: UITapGestureRecognizer?
}

