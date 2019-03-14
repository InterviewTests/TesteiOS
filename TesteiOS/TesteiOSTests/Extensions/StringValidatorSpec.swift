//
//  StringValidatorSpec.swift
//  TesteiOSTests
//
//  Created by Brendoon Ryos on 25/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOS

class StringValidatorSpec: QuickSpec {
  override func spec() {
    describe("the String Validator") {
      it("should be able to check if it's an valid email") {
        var email = "abc@test.com"
        expect(email.isValidEmail).to(beTrue())
        email = "acv"
        expect(email.isValidEmail).toNot(beTrue())
        email = "acc.com"
        expect(email.isValidEmail).toNot(beTrue())
        email = "acc@"
        expect(email.isValidEmail).toNot(beTrue())
        email = ".@"
        expect(email.isValidEmail).toNot(beTrue())
      }
      it("should be able to check if it's an valid CPF") {
        var cpf = "06668090389"
        expect(cpf.isValidCPF).to(beTrue())
        cpf = "06668090387"
        expect(cpf.isValidCPF).toNot(beTrue())
        cpf = "0666809"
        expect(cpf.isValidCPF).toNot(beTrue())
        cpf = "0666809ab"
        expect(cpf.isValidCPF).toNot(beTrue())
      }
      it("should be able to check if it's an valid password") {
        var password = "Abc@10"
        expect(password.isValidPassword()).to(beTrue())
        password = "abc"
        expect(password.isValidPassword()).toNot(beTrue())
        password = "Abc"
        expect(password.isValidPassword()).toNot(beTrue())
        password = "Abc@"
        expect(password.isValidPassword()).toNot(beTrue())
        password = "0666809ab"
        expect(password.isValidPassword()).toNot(beTrue())
      }
    }
  }
}
