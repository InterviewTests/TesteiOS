//
//  BuilderInterface.swift
//  SantanderApp
//
//  Created by Andre Nogueira on 28/04/18.
//  Copyright © 2018 Andre Nogueira. All rights reserved.
//

import Foundation
import UIKit

protocol BuilderInterface{
    
    func buildView(formCell: CellEntity, signUpView: SantanderSignupView) -> UIView
    
}

