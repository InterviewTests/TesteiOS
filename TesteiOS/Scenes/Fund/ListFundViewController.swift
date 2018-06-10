//
//  ListFundViewController.swift
//  TesteiOS
//
//  Created by Macbook on 10/06/2018.
//  Copyright © 2018 mcaserta. All rights reserved.
//

import Foundation
import UIKit

protocol ListFundViewControllerInput
{
    
}

protocol ListFundViewControllerOutput
{
    func fetchItems()
}

class ListFundViewController : UIViewController, ListFundViewControllerInput {
    var output: ListFundViewControllerOutput!
    var router: ListFundRouter!
    
    // Lista de itens
    var listFund : Screen!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ListFundConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        output.fetchItems()
    }
    
    func successFetchedItems(response: ListFund.Fetch.Response) {
        listFund = response.screen
    }
    
    func errorFetchingItems(response: ListFund.Fetch.Response) {
        
    }
}
