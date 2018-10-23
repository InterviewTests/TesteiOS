//
//  PostDataPresenter.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit

protocol PresentPostData {
    func presentingPostData(data: DetailDataToBePosted)
}

class DataToBePostedPresenter: PresentPostData {
    
    weak var viewController: LoginViewController?
    
    func presentingPostData(data: DetailDataToBePosted) {
        
    }
}
