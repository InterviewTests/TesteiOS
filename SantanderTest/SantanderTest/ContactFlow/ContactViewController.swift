//
//  ContactViewController.swift
//  SantanderTest
//
//  Created by Filipe Oliveira on 27/06/19.
//  Copyright © 2019 Filipe Oliveira. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController
{
    private var model: ContactScreen?
    {
        didSet
        {
            
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Remove linha navigationBar
        self.navigationController?.navigationBar.backIndicatorImage = .init()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.shadowImage = .init()
        
        SantanderApiClient.request(operation: .contactForm) { (response: Result<ContactScreen,NSError>) in
            
            switch response
            {
                case .success(let result):
                    self.model = result
                
                case .failure(let error):
                    print(error)
            }
        }
    }
}

