//
//  Funds+DownInfo.swift
//  Santander
//
//  Created by Orlando Amorim on 15/08/19.
//

import Foundation

extension FundsScreen {
    struct DownInfo: Decodable {
        let name: String
        let data: String?
    }
}
