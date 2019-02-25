//
//  ContactWorkerSpec.swift
//  TesteiOSTests
//
//  Created by Brendoon Ryos on 25/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble
import Moya
import Alamofire

@testable import TesteiOS

class NetworkManagerMock: Networkable {
  var provider: MoyaProvider<BankAPI> = MoyaProvider<BankAPI>()
  
  func fetchForm(request: Contact.Form.Request, completion: @escaping (Result<FormData>) -> ()) {
    let sampleData = BankAPI.fetchForm.sampleData
    let formData =  try? JSONDecoder().decode(FormData.self, from: sampleData)
    if let form = formData {
      completion(Result.success(form))
    } else {
      completion(Result.failure(NSError()))
    }
  }
  
  func fetchFund(request: Funds.Get.Request, completion: @escaping (Result<FundsData>) -> ()) {
    let sampleData = BankAPI.fetchFund.sampleData
    let fundsData =  try? JSONDecoder().decode(FundsData.self, from: sampleData)
    
    if let funds = fundsData {
      completion(Result.success(funds))
    } else {
      completion(Result.failure(NSError()))
    }
    
  }
}

class ContactWorkerSpec: QuickSpec {
  override func spec() {
    describe("a ContactWorker") {
      var worker: ContactWorker!
      
      beforeEach {
        worker = ContactWorker(networkManager: NetworkManagerMock())
      }
      
      it("should have a result value") {
        worker.fetchForm(request: Contact.Form.Request(), completion: { result in
          expect(result.value).notTo(beNil())
        })
      }
      it("should haven't a error ") {
        worker.fetchForm(request: Contact.Form.Request(), completion: { result in
          expect(result.error).to(beNil())
        })
      }
    }
  }
}
