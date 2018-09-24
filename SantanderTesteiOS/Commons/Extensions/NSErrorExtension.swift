//
//  NSErrorExtension.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//

import Foundation


extension NSError {
    static var generic : NSError {
        return NSError(domain: "Ocorreu um erro, por favor, tente novamente", code: -1, userInfo: nil)
    }
}
