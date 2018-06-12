//
//  FormData.swift
//  InvestApp
//
//  Created by Victor tavares on 06/06/2018.
//  Copyright © 2018 Santander. All rights reserved.
//

import Foundation


struct FormData: Decodable {
    let cells: [FormCell]?
}

struct FormCell {
    let id: Int?
    let type: Int?
    let message: String?
    let typefield: String?
    let hidden: Bool?
    let show: Int?
    let topSpacing: Double?
    let required: Bool?
}

extension FormCell: Decodable {

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case type = "type"
        case message = "message"
        case typefield = "typefield"
        case hidden = "hidden"
        case show = "show"
        case topSpacing = "topSpacing"
        case required = "required"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        let id = try container.decode(Int?.self, forKey: .id)
        let type = try container.decode(Int?.self, forKey: .type)
        let message = try container.decode(String?.self, forKey: .message)
        let hidden = try container.decode(Bool?.self, forKey: .hidden)
        let show = try container.decode(Int?.self, forKey: .show)
        let topSpacing = try container.decode(Double?.self, forKey: .topSpacing)
        let required = try container.decode(Bool?.self, forKey: .required)

        var typefieldStr: String?
        do {
            typefieldStr = try container.decode(String?.self, forKey: .typefield)
        } catch {
            if let typefieldInd = try container.decode(Int?.self, forKey: .typefield) {
                typefieldStr = String(typefieldInd)
            }
        }
        self.init(id: id, type: type, message: message, typefield: typefieldStr, hidden: hidden, show: show, topSpacing: topSpacing, required: required)
    }
}
