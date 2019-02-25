//
//  FormDataSpec.swift
//  TesteiOSTests
//
//  Created by Brendoon Ryos on 24/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOS

class FormDataSpec: QuickSpec {
  override func spec() {
    describe("a FormData") {
      var formData: FormData!
      
      beforeEach {
        let sampleData = BankAPI.fetchForm.sampleData
        formData = try? JSONDecoder().decode(FormData.self, from: sampleData)
      }
      
      it("should be able to create a formData from json") {
        expect(formData).notTo(beNil())
      }
    }
  }
}


