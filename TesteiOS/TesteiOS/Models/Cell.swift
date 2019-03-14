//
//  Cell.swift
//  TesteiOS
//
//  Created by Brendoon Ryos on 22/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Foundation
import Reusable

enum CellType: Int {
  case field = 1
  case text
  case image
  case checkbox
  case send
  case fundHeader
  case moreInfo
  case info
  case downInfo
  case invest
  
  func getNib() -> UINib {
    switch self {
    case .field:
      return TextFieldTableViewCell.nib
    case .text:
      return TextTableViewCell.nib
    case .checkbox:
      return CheckboxTableViewCell.nib
    case .send:
      return SendTableViewCell.nib
    case .fundHeader:
      return FundHeaderTableViewCell.nib
    case .moreInfo:
      return MoreInfoTableViewCell.nib
    case .info:
      return InfoTableViewCell.nib
    case .downInfo:
      return DownInfoTableViewCell.nib
    default:
      return InvestTableViewCell.nib
    }
  }
  
  func getIdentifier() -> String {
    switch self {
    case .field:
      return TextFieldTableViewCell.reuseIdentifier
    case .text:
      return TextTableViewCell.reuseIdentifier
    case .checkbox:
      return CheckboxTableViewCell.reuseIdentifier
    case .send:
      return SendTableViewCell.reuseIdentifier
    case .fundHeader:
      return FundHeaderTableViewCell.reuseIdentifier
    case .moreInfo:
      return MoreInfoTableViewCell.reuseIdentifier
    case .info:
      return InfoTableViewCell.reuseIdentifier
    case .downInfo:
      return DownInfoTableViewCell.reuseIdentifier
    default:
      return InvestTableViewCell.reuseIdentifier
    }
  }
  
  func getClass() -> UITableViewCell.Type {
    switch self {
    case .field:
      return TextFieldTableViewCell.self
    case .text:
      return TextTableViewCell.self
    case .checkbox:
      return CheckboxTableViewCell.self
    case .send:
      return SendTableViewCell.self
    case .fundHeader:
      return FundHeaderTableViewCell.self
    case .moreInfo:
      return MoreInfoTableViewCell.self
    case .info:
      return InfoTableViewCell.self
    case .downInfo:
      return DownInfoTableViewCell.self
    default:
      return InvestTableViewCell.self
    }
  }
  
  func getHeight() -> CGFloat {
    switch self {
    case .fundHeader:
      return 410
    case .moreInfo:
      return 200
    case .info, .downInfo:
      return 30
    default:
      return 80
    }
  }
}

enum TypeField: Int {
  case text = 1
  case telNumber
  case email
  
  var contentType: UITextContentType {
    switch self {
    case .telNumber:
      return .telephoneNumber
    case .email:
      return .emailAddress
    default:
      return .name
    }
  }
  
  var keyboardType: UIKeyboardType {
    switch self {
    case .telNumber:
      return .phonePad
    case .email:
      return .emailAddress
    default:
      return .default
    }
  }
}

struct Cell {
  let id: Int
  let type: Int
  let message: String
  let typefield: Int?
  let hidden: Bool
  let topSpacing: Int
  let show: Int?
  let required: Bool
}

extension Cell: Decodable {
  private enum CodingKeys: String, CodingKey {
    case id
    case type
    case message
    case typefield
    case hidden
    case topSpacing
    case show
    case required
  }
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id = try container.decode(Int.self, forKey: .id)
    type = try container.decode(Int.self, forKey: .type)
    message = try container.decode(String.self, forKey: .message)
    typefield = try? container.decode(Int.self, forKey: .typefield)
    hidden = try container.decode(Bool.self, forKey: .hidden)
    topSpacing = try container.decode(Int.self, forKey: .topSpacing)
    show = try? container.decode(Int.self, forKey: .show)
    required = try container.decode(Bool.self, forKey: .required)
  }
}
