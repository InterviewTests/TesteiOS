//
//  FormTest.swift
//  SantanderInvestmentAppTests
//
//  Created by m.a.carvalho on 19/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import SantanderInvestmentApp

final class FormViewControllerSpec: QuickSpec {
    override func spec() {
        describe("shoult test Form Worker") {
            context("when test mocked API") {
                it("should test success call API") {
                    let worker = FormWorker()
                    worker.getForm(session: MockURLSession(with: "cells", statusCode: 200), completion: { cells in
                        expect(cells.count) > 0
                    }, failure:{ _ in })
                }
                it("should test error call API") {
                    let worker = FormWorker()
                    worker.getForm(session: MockURLSession(with: "cells", statusCode: 500), completion: { _ in
                    }, failure:{ error in
                        expect(error).toNot(beNil())
                    })
                }
            }
        }
    }
}

