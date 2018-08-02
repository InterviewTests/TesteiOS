//
//  ViewController.swift
//  TesteiOS
//
//  Created by Dafle Cardoso on 02/08/2018.
//  Copyright © 2018 Dafle Cardoso. All rights reserved.
//

import UIKit

class InvestimentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        RestAPI.fetchGenericObject(endPoint: "fund.json", onComplete: { (response: InvestimentResponse) in
            
            
            print(response.screen.fundName)
            
        }) { (apiError) in
            
            
            print("an error occourred ", apiError)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

