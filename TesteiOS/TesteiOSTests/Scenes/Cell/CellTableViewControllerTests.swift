//
//  CellTableViewControllerTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class CellsViewControllerTests: XCTestCase
{
    // MARK: - Subject under test
    
    var sut: CellTableViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp()
    {
        super.setUp()
        window = UIWindow()
        setupCellsViewController()
    }
    
    override func tearDown()
    {
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupCellsViewController()
    {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "CellTableViewController") as! CellTableViewController
    }
    
    func loadView()
    {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class CellsBusinessLogicSpy: CellsBusinessLogic
    {
        var cells: [Cell]?
        
        // MARK: Method call expectations
        
        var fetchCellsCalled = false
        
        // MARK: Spied methods
        
        func fetchCells(request: Cells.FetchCells.Request)
        {
            fetchCellsCalled = true
        }
    }
    
    class TableViewSpy: UITableView
    {
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldFetchCellsWhenViewDidAppear()
    {
        // Given
        let cellsBusinessLogicSpy = CellsBusinessLogicSpy()
        sut.interactor = cellsBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidAppear(true)
        
        // Then
        XCTAssert(cellsBusinessLogicSpy.fetchCellsCalled, "Should fetch cells right after the view appears")
    }
    
    func testShouldDisplayFetchedCells()
    {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        
        // When
        let displayedCell = Cells.FetchCells.ViewModel.DisplayedCell(id: 1, type: 2, message: "Mensagem informativa para exibição", typefield: nil, hidden: false, topSpacing: 60.0, show: nil, required: false)
        let displayedCells = [displayedCell]
        let viewModel = Cells.FetchCells.ViewModel(displayedCells: displayedCells)
        sut.displayFetchedCells(viewModel: viewModel)
        
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched cells should reload the table view")
    }
    
    func testNumberOfSectionsInTableViewShouldAlwaysBeOne()
    {
        // Given
        let tableView = sut.tableView
        
        // When
        let numberOfSections = sut.numberOfSections(in: tableView!)
        
        // Then
        XCTAssertEqual(numberOfSections, 1, "The number of table view sections should always be 1")
    }
    
    func testNumberOfRowsInAnySectionShouldEqualNumberOfCellsToDisplay()
    {
        // Given
        let tableView = sut.tableView
        let displayedCell = Cells.FetchCells.ViewModel.DisplayedCell(id: 1, type: 2, message: "Mensagem informativa para exibição", typefield: nil, hidden: false, topSpacing: 60.0, show: nil, required: false)
        let testDisplayedCells = [displayedCell]
        sut.displayedCells = testDisplayedCells
        
        // When
        let numberOfRows = sut.tableView(tableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, testDisplayedCells.count, "The number of table view rows should equal the number of cells to display")
    }
    
    func testShouldConfigureTableViewCellToDisplayCell()
    {
        // Given
        let tableView = sut.tableView
        let displayedCell = Cells.FetchCells.ViewModel.DisplayedCell(id: 1, type: 2, message: "Mensagem informativa para exibição", typefield: nil, hidden: false, topSpacing: 60.0, show: nil, required: false)
        let testDisplayedCells = [displayedCell]
        sut.displayedCells = testDisplayedCells
        
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        let cell: FormTableViewCell = sut.tableView(tableView!, cellForRowAt: indexPath) as! FormTableViewCell
        
        // Then
        XCTAssertEqual(cell.label?.text, "Mensagem informativa para exibição", "A properly configured table view cell should display the cell date")
    }
}

