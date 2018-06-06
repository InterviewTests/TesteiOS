//
//  SwinjectConnection.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation
import SwinjectStoryboard
//
extension SwinjectStoryboard {
    class func setup() {
        defaultContainer.storyboardInitCompleted(FormViewController.self) { r, c in
            c.apiFetcher = r.resolve(Fetcher.self)
            
        }
        
        defaultContainer.storyboardInitCompleted(FundosTableViewController.self) { r, c in
            c.apiFetcher = r.resolve(Fetcher.self)
            
        }
        
        
        defaultContainer.register(Networking.self) { _ in APIClient() }
        
        defaultContainer.register(Fetcher.self) { r in
            Fetcher(networking: r.resolve(Networking.self)!)
        }
        
        
    }
}
