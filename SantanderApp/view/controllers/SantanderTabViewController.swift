//
//  SantanderViewController.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 12/07/2018.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit

class SantanderTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBar.appearance().tintColor = UIColor.white
//        UITabBar.appearance().backgroundColor = UIColor.red
//        self.tabBarItem.selectedImage = UIImage(named: "tab_item_invest")
        self.tabBar.backgroundImage = UIImage(named: "tab_item_invest")
        self.tabBar.itemPositioning = .fill
//        UITabBarItem.appearance().setTitleTextAttributes(UIFont., for: <#T##UIControlState#>)
        debugPrint(R.font.dinProRegular.fontName)
        let attributes = [NSAttributedStringKey.font: UIFont(name: "DINPro", size: 18),
                          NSAttributedStringKey.foregroundColor: UIColor.white]
        let appearance = UITabBarItem.appearance()
        appearance.setTitleTextAttributes(attributes, for: .normal)
        
//        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Arial", size: 10)!], for: .normal)
//         UITabBarItem.appearance().setTitleTextAttributes(<#T##attributes: [NSAttributedStringKey : Any]?##[NSAttributedStringKey : Any]?#>, for: <#T##UIControlState#>)
        
        //        self.tabBarController?.tabBar.items![0].font
//        self.tabBarItem.isEnabled = false
//        self.tabBarController?.tabBar.items![0].image = nil
//        self.tabBar.itemWidth = CGFloat(200)
//        let tabBarItem = self.tabBar.items![0]
//        tabBarItem.image = nil
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
