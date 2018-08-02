//
//  ViewController.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import UIKit

class InvestimentViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestAPI.fetchGenericObject(endPoint: "fund.json", onComplete: { (response: InvestimentResponse) in
            
            self.buildLayout(response)
            
        }) { (apiError) in
            
            self.showAlert(title: "Atenção", message: self.getFormatedError(apiError))
        }
    }
    
    func buildLayout(_ response:InvestimentResponse) {
        
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}









