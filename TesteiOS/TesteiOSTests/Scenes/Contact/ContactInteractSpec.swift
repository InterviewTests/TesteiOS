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
      
      beforeEach {
        let request = Contact.Form.Request()
        let worker = ContactWorker(networkManager: NetworkManagerMock())
        interact = ContactInteractor(worker: worker)
        interact.fetchForm(request: request)
        interact.sendFormData(request: Contact.Send.Request(values: []))
      }
      
      it("should have a worker") {
        expect(interact.worker).notTo(beNil())
      }
    }
  }
}
