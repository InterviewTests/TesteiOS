//
//  UtilEnuns.swift
//  Investimentos
//
//  Created by Adolfho Athyla on 10/09/2018.
//  Copyright © 2018 a7hyla. All rights reserved.
//

import UIKit

enum CellIdentifier: Int {
    case Presentation = 1, Name, RegisterEmail, Email, Phone = 6, Send = 7
}

enum Type: Int {
    case field = 1, text, image, checkbox, send
}

enum TypeField: Int {
    case text = 1, telNumber, email
}
