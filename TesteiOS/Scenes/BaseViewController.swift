//
//  BaseViewController.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    let font = UIFont(name: "DINPro-Regular", size: 15.0)

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showAlert(title:String, message:String) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        show(alert, sender: nil)
    }
    
    func getFormatedError(_ apiError: ApiError) -> String {
        
        switch apiError {
            case .url:
                return "Não foi possível efetura a requisição url inválida"
            case .taskError(let error):
                return "Ocorreu um erro no dipositivo detalhes: \(error.localizedDescription)"
            case .noResponse:
                return "Não foi possível obter resposta do servidor"
            case .noData:
                return "Nenhum dado recebido"
            case .responseStatusCode(let code):
                return "Código de resposta do servidor: \(code)"
            case .invalidJSON:
                return "Dados inválidos, por favor tente mais tarde"
        }
    }
}
