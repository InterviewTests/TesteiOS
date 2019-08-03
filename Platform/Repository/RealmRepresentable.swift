//
//  RealmRepresentable.swift
//  ToDoList1.1
//
//  Created by Erika de Almeida Segatto on 17/02/18.
//  Copyright © 2018 Erika de Almeida Segatto. All rights reserved.
//

import Foundation

protocol RealmRepresentable {
    associatedtype RealmType: DomainConvertibleType
    
    var uid: String {get}
    
    func asRealm() -> RealmType
}
