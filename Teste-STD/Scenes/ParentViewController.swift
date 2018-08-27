//
//  ParentViewController.swift
//  Teste-STD
//
//  Created by Phelipe Campos on 22/05/18.
//  Copyright © 2018 Phelipe Campos. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class ParentViewController: ButtonBarPagerTabStripViewController {
let purpleInspireColor = UIColor(red:0.13, green:0.03, blue:0.25, alpha:1.0)
let red = UIColor(red:218.0/255.0, green:1.0/255.0, blue:1.0/255.0, alpha:1.0)
let redSelected = UIColor(red:160.0/255.0, green:4.0/255.0, blue:4.0/255.0, alpha:1.0)
    override func viewDidLoad() {
        super.viewDidLoad()
        
       defineStyleTabBar()
  
    }
    func defineStyleTabBar(){
        buttonBarView.selectedBar.backgroundColor = redSelected
        buttonBarView.selectedBar.tintColor = redSelected
        settings.style.buttonBarBackgroundColor = .white
        settings.style.buttonBarItemBackgroundColor = red
        settings.style.selectedBarBackgroundColor = redSelected
        settings.style.buttonBarItemFont = .boldSystemFont(ofSize: 14)
        settings.style.selectedBarHeight = 2.0
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = .black
        settings.style.buttonBarItemsShouldFillAvailiableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = .lightText
            newCell?.label.textColor = .white
            // Do any additional setup after loading the view.
        }
    }
        
    override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
        let child_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "showInvestment")
        let child_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "showContact")
        return [child_1, child_2]
    }
   

}
