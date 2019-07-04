//
//  InvestmentManager.swift
//  Teste Santander
//
//  Created by Luann Marques Luna on 04/07/19.
//  Copyright © 2019 Luann Luna. All rights reserved.
//

import Alamofire
import SwiftyJSON

class InvestmentManager {
    let manager = Alamofire.SessionManager.default
    let url = URL(string: "https://floating-mountain-50292.herokuapp.com/fund.json")!
    
    var screenInfo: InvestimentScreen?
    
    func getData(onCompletion: @escaping () -> Void) {
        manager.request(url).validate().responseJSON { (response) in
            switch response.result {
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            case .success(let value):
                let json = JSON(value)
                self.screenInfo = InvestimentScreen(json["screen"])
                onCompletion()
            }
        }
        
    }
    
}
