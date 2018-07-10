//
//  SendMessageModels.swift
//  TesteiOS
//
//  Created by Felipe Borges on 09/07/18.
//  Copyright (c) 2018 Felipe Borges. All rights reserved.
//
//

import UIKit

enum SendMessage
{
  // MARK: Use cases
  
  enum Something
  {
    struct Request {
        let url = URL(string: "https://floating-mountain-50292.herokuapp.com/cells.json")!
    }
    enum Response {
        case success(Data)
        case error(Error)
    }
    struct ViewModel
    {
    }
  }
}
