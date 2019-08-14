//
//  Contact.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import Foundation

struct ContactForm: Decodable {
    
    let cells: [FormCell]

    private enum CodingKeys: String, CodingKey {
        case cells
    }
}
