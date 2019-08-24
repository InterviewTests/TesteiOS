//
//  FormController.swift
//  Teste Zup
//
//  Created by Vinicius Mangueira on 22/08/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import UIKit

class FormController: UIViewController  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
        FormService.getForm { (result) in
            switch result {
                case .failure(let error):
                    print(error)
                case .success(let form):
                print(form)
            }
        }
        
        
    }
    
}
