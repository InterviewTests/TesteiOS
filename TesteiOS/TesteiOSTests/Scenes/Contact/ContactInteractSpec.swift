//
//  ContactInteractSpec.swift
//  TesteiOSTests
//
//  Created by Brendoon Ryos on 25/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOS

class ContactInteractorSpec: QuickSpec {
  override func spec() {
    describe("a ContactInteractor") {
      var interact: ContactInteractor!
      var request: Contact.Form.Request!
      
      beforeEach {
        request = Contact.Form.Request()
        interact = ContactInteractor()
        interact.fetchForm(request: request)
        interact.sendFormData(request: Contact.Send.Request(values: []))
      }
      
      it("should have a worker") {
        expect(interact.worker).notTo(beNil())
      }
    }
  }
}
