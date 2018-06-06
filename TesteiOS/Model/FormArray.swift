//
//  FormArray.swift
//  TesteiOS
//
//  Created by Eduardo Lombardi on 01/06/2018.
//  Copyright © 2018 Eduardo Lombardi. All rights reserved.
//

import Foundation

class FormArray:Decodable {
   let cells:Array<Form>
    
    init(cells:Array<Form>) {
        self.cells = cells
    }

}
