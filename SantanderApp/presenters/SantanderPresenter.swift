//
//  SantanderPresenter.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 25/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import UIKit
protocol SantanderPresenterInterface: class{
    func fetchedCells(completion: @escaping (_ cellsSantander: Cells?, _ error: Error?) -> Void)
    func fetchedFundScreen(completion: @escaping (_ screen: Screen?, _ error: Error?) -> Void)

}

class SantanderPresenter: SantanderPresenterInterface {
    static let sharedManager: SantanderPresenterInterface = {
        let santanderPresenter = SantanderPresenter()
        return santanderPresenter
    }()
    
    func fetchedCells(completion: @escaping (_ cellsSantander: Cells?, _ error: Error?) -> Void){
        SantanderInteractor.sharedManager.fetchCellEntity { (cells, error) in
            completion(cells, error)
        }
    }
    
    func fetchedFundScreen(completion: @escaping (_ screen: Screen?, _ error: Error?) -> Void){
        SantanderInteractor.sharedManager.fetchFundScreen { (screen, error) in
            completion(screen, error)
        }
    
    }
    
    
}
