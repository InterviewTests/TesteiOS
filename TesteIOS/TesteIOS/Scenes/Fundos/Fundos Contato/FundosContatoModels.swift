//
//  FundosContatoModels.swift
//  TesteIOS
//
//  Created by Developer RedFox on 07/08/2018.
//  Copyright © 2018 AndreOta. All rights reserved.
//

import UIKit

enum FundosContato {
    struct MessageFormFields {
        var name: String
        var email: String
        var phone: String
    }
    
    enum SendMessage {
        struct Request {
            var messageFormFields: MessageFormFields
        }
    }
}
