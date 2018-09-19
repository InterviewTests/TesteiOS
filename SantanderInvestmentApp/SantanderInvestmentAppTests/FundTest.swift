//
//  FundTest.swift
//  SantanderInvestmentAppTests
//
//  Created by m.a.carvalho on 19/09/18.
//  Copyright © 2018 Michel de Sousa Carvalho. All rights reserved.
//

import Quick
import Nimble

@testable import SantanderInvestmentApp

final class FundViewControllerSpec: QuickSpec {
    override func spec() {
        describe("shoult test Fund Worker") {
            context("when test mocked API") {
                it("should test success call API") {
                    let worker = FundWorker()
                    worker.getFund(session: MockURLSession(with: "fund", statusCode: 200), completion: { fund in
                        expect(fund).toNot(beNil())
                    }, failure: { _ in
                    })
                }
                it("should test error call API") {
                    let worker = FundWorker()
                    worker.getFund(session: MockURLSession(with: "fund", statusCode: 500), completion: { _ in
                    }, failure: { error in
                        expect(error).toNot(beNil())
                    })
                }
            }
        }
    }
}

