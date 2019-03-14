//
//  FundsInteractorSpec.swift
//  TesteiOSTests
//
//  Created by Brendoon Ryos on 25/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOS

class FundsInteractorSpec: QuickSpec {
  override func spec() {
    describe("a ContactInteractor") {
      var interact: FundsInteractor!
      
      beforeEach {
        let request = Funds.Download.Request(url: .none)
        let worker = FundsWorker(networkManager: NetworkManagerMock())
        interact = FundsInteractor(worker: worker)
        interact.downloadData(request: request)
      }
      
      it("should have a worker") {
        expect(interact.worker).notTo(beNil())
      }
      it("should have an url") {
        expect(interact.url).to(equal("https://www.google.com/"))
      }
    }
  }
}
