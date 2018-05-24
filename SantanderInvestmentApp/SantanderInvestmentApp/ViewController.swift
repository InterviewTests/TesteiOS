//
//  ViewController.swift
//  SantanderInvestmentApp
//
//  Created by Michel de Sousa Carvalho on 23/05/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import UIKit

struct Return: Codable {
    let msg: String?
}

struct Service: Codable{
    let msg: String?
    let msg2: String?
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Request.load(resource: testPost(), completion: { data in
            print("Post \(data)")
        })
        Request.load(resource: getService(), completion: { data in
            print("Get \(data)")
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func testPost() -> Resource<Return> {
        let url = URL(string: "https://demo4558816.mockable.io/teste")!
        let dictionary = ["": ""]
        return Resource<Return>(url: url, method: .post(dictionary), parseJSON: { result in
            return result
        })
    }

    func getService() -> Resource<Service> {
        let url = URL(string: "https://demo1457479.mockable.io/getServicee")!
        return Resource<Service>(url: url, parseJSON: { result in
            return result
        })
    }
    
    
    

}

