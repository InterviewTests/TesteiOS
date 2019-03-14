//
//  ContactDataSourceSpec.swift
//  TesteiOSTests
//
//  Created by Brendoon Ryos on 24/02/19.
//  Copyright © 2019 Brendoon Ryos. All rights reserved.
//

import Quick
import Nimble

@testable import TesteiOS

class TableViewDelegateMock: NSObject, UITableViewDelegate {
  
}

class ContactDataSourceSpec: QuickSpec {
  override func spec() {
    describe("a ContactDataSource") {
      var dataSource: ContactDataSource!
      var cells: [Cell]!
      var tableView: UITableView!
      
      beforeEach {
        let sampleData = BankAPI.fetchForm.sampleData
        let formData = try? JSONDecoder().decode(FormData.self, from: sampleData)
        cells = formData?.cells
        
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: 300, height: 500))
        dataSource = ContactDataSource(tableView: tableView, delegate: TableViewDelegateMock())
        dataSource.update(with: cells)
      }
      it("should have a valid dataSource") {
        expect(dataSource).toNot(beNil())
      }
      it("should have the expected number of items") {
        let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        expect(count).to(equal(5))
      }
      it("should show only the not hidden cells") {
        let items = [cells[2], cells[0]]
        dataSource.update(with: items)
        let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        expect(cells[2].hidden).to(beTrue())
        expect(count).to(equal(1))
      }
      it("should have be able to update items") {
        let items = [cells[0], cells[0]]
        dataSource.update(with: items)
        let count = dataSource.tableView(tableView, numberOfRowsInSection: 0)
        expect(count).to(equal(2))
      }
      it("should return the expected cell") {
        let cell = dataSource.tableView(tableView, cellForRowAt: IndexPath(row: 0, section: 0))
        expect(cell).to(beAKindOf(ContactBaseTableViewCell.self))
      }
      it("should have be able to update values") {
        dataSource.sendButtonPressed()
        expect(dataSource.values).to(be([]))
      }
      it("should have the expected number of values") {
        dataSource.validValue(("Email", "test@test.com"))
        expect(dataSource.values.count).to(equal(1))
      }
      it("should have upadeted the value data") {
        dataSource.validValue(("Email", "test2@test.com"))
        let data = dataSource.values[0].data as! String
        expect(data).to(equal("test2@test.com"))
      }
      it("should remove the value") {
        dataSource.validValue(("Email", ""))
        expect(dataSource.values[0]).toNot(be(("Email", "")))
      }
    }
  }
}
