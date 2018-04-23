//
//  ContactModels.swift
//  Santander
//
//  Created by Gabriel vieira on 4/22/18.
//  Copyright (c) 2018 Gabriel vieira. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum Contact
{
  // MARK: Use cases
  
  enum fetchFormCells
  {
    struct Request
    {
        
    }
    struct Response
    {
        var cells: [Cells]
    }
    struct ViewModel
    {
        struct DisplayCells {
            var hidden: Bool
            var id: Int
            var topSpacing: Int
            var typefield: String
            var required: Bool
            var message: String
            var type: Int
            var show: Int
        }
        
        var displayCells: [DisplayCells]
    }
  }
}
