//
//  FormSuccessViewController.swift
//  TesteiOS
//
//  Created by lucas.eiji.saito on 10/07/18.
//  Copyright © 2018 Accenture. All rights reserved.
//

import UIKit

class FormSuccessViewController: UIViewController {

    @IBAction func buttonTouchUpInside(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
