//
//  RMUser.swift
//  Platform
//
//  Created by Erika de Almeida Segatto on 06/09/18.
//  Copyright © 2018 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import RealmSwift
import Realm
import Domain

final class RMUser: Object {
    @objc dynamic var id: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var dateOfBirth: Date?
    @objc dynamic var gender: String?
    
    //    @objc dynamic var category: RMCategory?
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

extension RMUser: DomainConvertibleType {
    func asDomain() -> User {
        return User(id: id, name: name, dateOfBirth: dateOfBirth, gender: gender)
    }
}

extension User: RealmRepresentable {
    internal var uid: String {
        return self.id
    }

    func asRealm() -> RMUser {
        return RMUser.build { object in
            object.id = id
            object.name = name
            object.dateOfBirth = dateOfBirth
            object.gender = gender
        }
    }
}
