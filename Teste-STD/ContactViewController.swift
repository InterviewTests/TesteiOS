//
//  ViewController.swift
//  Teste-STD
//
//  Created by Phelipe Campos on 21/05/18.
//  Copyright © 2018 Phelipe Campos. All rights reserved.
//

import UIKit
import Material
import XLPagerTabStrip
class ContactViewController: UIViewController  {

    @IBOutlet weak var txtName: TextField!
    @IBOutlet weak var txtEmail: TextField!
    @IBOutlet weak var txtPhone: TextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
extension ContactViewController: IndicatorInfoProvider{
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Contato")
    }
}

