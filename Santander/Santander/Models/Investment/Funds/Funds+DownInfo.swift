//
//  Funds+DownInfo.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import Foundation

extension Investment.Funds.Response.Screen {
    struct DownInfo: Decodable {
        let name: String
        let data: String?
    }
}
