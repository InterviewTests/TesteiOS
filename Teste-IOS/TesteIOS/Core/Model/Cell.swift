//
//  Cell.swift
//  TesteIOS
//
//  Created by Diego Ramos de Almeida on 23/07/18.
//  Copyright © 2018 Diego Ramos de Almeida. All rights reserved.
//

import Foundation

struct CellRoot: Codable {
    var cells: [Cell]
}

struct Cell: Codable {
    var id: Int?
    var type: FormType?
    var message: String?
    var typefield: TypeField?
    var hidden: Bool?
    var topSpacing: Float?
    var show: Int?
    var required: Bool?
    
    init() {}
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        type = try container.decode(FormType.self, forKey: .type)
        message = try container.decode(String.self, forKey: .message)
        hidden = try container.decode(Bool.self, forKey: .hidden)
        topSpacing = try container.decode(Float.self, forKey: .topSpacing)
        do {
            show = try container.decode(Int.self, forKey: .show)
        } catch {
            
        }
        required = try container.decode(Bool.self, forKey: .required)
        
        // O typefield em alguns casos está retornando uma string em vez de um inteiro.
        do {
            let field = try container.decode(Int.self, forKey: .typefield)
            typefield = TypeField(rawValue: field)
        } catch {
            do {
                let string = try container.decode(String.self, forKey: .typefield)
                switch string {
                case "text":
                    typefield = TypeField.text
                    break
                case "telnumber":
                    typefield = TypeField.telNumber
                    break
                case "email":
                    typefield = TypeField.email
                    break
                case "":
                    typefield = TypeField.null
                    break
                default:
                    typefield = TypeField.text
                }
            } catch {
                typefield = TypeField.null
            }
        }
    }
}

