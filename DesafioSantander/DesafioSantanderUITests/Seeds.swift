//
//  Seeds.swift
//  Gister
//
//  Created by Raymond Law on 10/20/17.
//  Copyright © 2017 Clean Swift LLC. All rights reserved.
//

@testable import DesafioSantander
import XCTest

struct Seeds
{
  struct Forms
  {
    static let text = cellStruct(id: 1, type: 1, message: "isso ai", typefield: 2, hidden: false, topSpacing: 10, show: 3, required: false)
    static let html = cellStruct(id: 2, type: 3, message: "Segundo",  typefield: nil, hidden: true, topSpacing: 20, show: nil, required: true)
  }
  
  struct DisplayedForm
  {
    static let text = Form.FecthForm.ViewModel.DisplayedCell(id: Forms.text.id!, message: Forms.text.message!, type: Forms.text.type!, typefield: Forms.text.typefield, hidden: Forms.text.hidden!, topSpacing: Forms.text.topSpacing!, show: Forms.text.show, required: Forms.text.required!)
    static let html = Form.FecthForm.ViewModel.DisplayedCell(id: Forms.html.id!, message: Forms.html.message!, type: Forms.html.type!, typefield: Forms.html.typefield, hidden: Forms.html.hidden!, topSpacing: Forms.html.topSpacing!, show: Forms.html.show, required: Forms.html.required!)
  }
  
}
