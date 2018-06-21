//
//  ListInvestmentViewController.swift
//  Teste-STD
//
//  Created by Phelipe Campos on 22/05/18.
//  Copyright © 2018 Phelipe Campos. All rights reserved.
//

import UIKit
import XLPagerTabStrip

class ListInvestmentViewController: UIViewController  {
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ListInvestmentViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Investimento")
    }
}
