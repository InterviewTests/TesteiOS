/* 
Copyright (c) 2018 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Cell : Codable {
	let id : Int?
	let type : Int?
	let message : String?
	let typefield : Int?
	let hidden : Bool?
	let topSpacing : Float?
	let show : Int?
	let required : Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case type = "type"
		case message = "message"
		case typefield = "typefield"
		case hidden = "hidden"
		case topSpacing = "topSpacing"
		case show = "show"
		case required = "required"
	}
    
    enum CellType: Int {
        case field = 1
        case text = 2
        case image = 3
        case checkbox = 4
        case send = 5
    }
    
    enum CellTypeField: Int {
        case text = 1
        case telNumber = 2
        case email = 3
    }

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		type = try values.decodeIfPresent(Int.self, forKey: .type)
		message = try values.decodeIfPresent(String.self, forKey: .message)
        do {
            typefield = try values.decodeIfPresent(Int.self, forKey: .typefield)
        } catch {
            let typefieldString = try values.decodeIfPresent(String.self, forKey: .typefield)
            switch typefieldString {
            case "text":
                typefield = 1
            case "telnumber":
                typefield = 2
            case "email":
                typefield = 3
            default:
                typefield = nil
            }
        }
		hidden = try values.decodeIfPresent(Bool.self, forKey: .hidden)
		topSpacing = try values.decodeIfPresent(Float.self, forKey: .topSpacing)
		show = try values.decodeIfPresent(Int.self, forKey: .show)
		required = try values.decodeIfPresent(Bool.self, forKey: .required)
	}

}
