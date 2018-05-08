//
//  ViewController.swift
//  FundosApp
//
//  Created by Vitor Ferraz on 08/05/2018.
//  Copyright © 2018 Vitor Ferraz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let test = NetworkManager(url: Routes.cells.endpoint, method: .get)
        test.response { (resultHelper) in
            switch resultHelper{
            case .success(let statusCode,let data):
                print("Status code:\(statusCode)")
                dump(data)
                let decoder = JSONDecoder()
                let items = try? decoder.decode(Cells.self, from: data)
                dump(items)
                
            case .error(let error):
                print(error)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

