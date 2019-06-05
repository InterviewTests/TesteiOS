//
//  Form.swift
//  santanderTest
//
//  Created by Adauto Oliveira on 28/05/19.
//  Copyright © 2019 Adauto Oliveira. All rights reserved.
//

import Foundation

struct Form: Equatable {
    var id: Int
    var type: Int
    var message: String
    var typefield: Bool
    var hidden: Bool
    var topSpacing: Double
    var show: Int
    var required: Bool
}

func ==(lhs: Form, rhs: Form) -> Bool{
    return lhs.id == rhs.id
        && lhs.type == rhs.type
        && lhs.message == rhs.message
        && lhs.typefield == rhs.typefield
        && lhs.hidden == rhs.hidden
        && lhs.topSpacing == rhs.topSpacing
        && lhs.show == rhs.show
        && lhs.required == rhs.required
}
