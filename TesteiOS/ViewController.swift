//
//  ViewController.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 28/05/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class ViewController: UIViewController {

    @IBOutlet weak var uiTextField: SkyFloatingLabelTextField?
    var apiFetcher: Fetcher?
    override func viewDidLoad() {
        super.viewDidLoad()
        let lightGreyColor = UIColor(red: 172/255, green: 172/255, blue: 172/255, alpha: 1.0)
        uiTextField?.placeholder = "TESTE "
        uiTextField?.title = "TESTE"
        uiTextField?.selectedTitleColor = lightGreyColor
        
        apiFetcher?.fetch(request: Router.Form.create(jsonParameters: "").asURLRequest()) { data in
            print(data)
            
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

