//
//  ListCellViewController.swift
//  TesteiOS
//
//  Created by Maurício Caserta on 07/06/2018.
//  Copyright © 2018 Maurício Caserta. All rights reserved.
//

import Foundation
import UIKit

protocol ListCellViewControllerInput
{
    
}

protocol ListCellViewControllerOutput
{
    func fetchItems()
}

class ListCellViewController: UIViewController, ListCellViewControllerInput {
    
    var output: ListCellViewControllerOutput!
    var router: ListCellRouter!
    
    // MARK: - Object lifecycle
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
        ListCellConfigurator.sharedInstance.configure(viewController: self)
    }
    
    override func viewDidLoad(){
        super.viewDidLoad()
        output.fetchItems()
    }
    
    func successFetchedItems(response: ListCell.Fetch.Response) {
        print(response.cells)
    }
    
    func errorFetchingItems(response: ListCell.Fetch.Response) {
        
    }
}
