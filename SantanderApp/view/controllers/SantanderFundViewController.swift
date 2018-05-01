//
//  SantanderFundViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 30/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderFundViewController: UIViewController {

    
    @IBOutlet var santanderFundView: SantanderFundView!
    
    override func viewDidLoad() {
        
        SantanderPresenter.sharedManager.fetchedFundScreen(completion: { (screen, error) in
            print(screen)
            let screenInfo = screen?.screenData!
            
            let fundName = (screenInfo?.fundName)!
            let topTitle = (screenInfo?.title)!
            let definition = (screenInfo?.definition)!
            let riskTitle = (screenInfo?.riskTitle)!
            let whatIs = (screenInfo?.whatIs)!
            let moreInfo = (screenInfo?.infoTitle)!
            self.santanderFundView.startFundView(subtitle: topTitle, fundName: fundName, whatIs: whatIs, riskTitle: riskTitle, definitionLabel: definition, moreInfo: moreInfo)
        })
    }
}
