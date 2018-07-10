//
//  FundsTableViewControllerTests.swift
//  TesteiOSTests
//
//  Created by Bruno Pampolha on 7/9/18.
//  Copyright © 2018 Bruno Pampolha. All rights reserved.
//

import XCTest
@testable import TesteiOS

class FundsViewControllerTests: XCTestCase {
    // MARK: - Subject under test
    
    var sut: FundTableViewController!
    var window: UIWindow!
    
    // MARK: - Test lifecycle
    
    override func setUp() {
        super.setUp()
        window = UIWindow()
        setupFundsViewController()
    }
    
    override func tearDown() {
        window = nil
        super.tearDown()
    }
    
    // MARK: - Test setup
    
    func setupFundsViewController() {
        let bundle = Bundle.main
        let storyboard = UIStoryboard(name: "Main", bundle: bundle)
        sut = storyboard.instantiateViewController(withIdentifier: "FundTableViewController") as! FundTableViewController
    }
    
    func loadView() {
        window.addSubview(sut.view)
        RunLoop.current.run(until: Date())
    }
    
    // MARK: - Test doubles
    
    class FundsBusinessLogicSpy: FundsBusinessLogic {
        var funds: [Fund]?
        
        // MARK: Method call expectations
        
        var fetchFundsCalled = false
        
        // MARK: Spied methods
        
        func fetchFunds(request: Funds.FetchFunds.Request) {
            fetchFundsCalled = true
        }
    }
    
    class TableViewSpy: UITableView {
        // MARK: Method call expectations
        
        var reloadDataCalled = false
        
        // MARK: Spied methods
        
        override func reloadData()
        {
            reloadDataCalled = true
        }
    }
    
    // MARK: - Tests
    
    func testShouldFetchFundsWhenViewDidAppear() {
        // Given
        let fundsBusinessLogicSpy = FundsBusinessLogicSpy()
        sut.interactor = fundsBusinessLogicSpy
        loadView()
        
        // When
        sut.viewDidAppear(true)
        
        // Then
        XCTAssert(fundsBusinessLogicSpy.fetchFundsCalled, "Should fetch funds right after the view appears")
    }
    
    func testShouldDisplayFetchedFunds() {
        // Given
        let tableViewSpy = TableViewSpy()
        sut.tableView = tableViewSpy
        
        // When
        let month = Funds.FetchFunds.ViewModel.DisplayedMonth(fund: 0.3, cdi: 0.3)
        let year = Funds.FetchFunds.ViewModel.DisplayedYear(fund: 13.01, cdi: 12.08)
        let twelveMonths = Funds.FetchFunds.ViewModel.DisplayedTwelveMonths(fund: 17.9, cdi: 17.6)
        let moreInfo = Funds.FetchFunds.ViewModel.DisplayedMoreInfo(month: month, year: year, twelveMonths: twelveMonths)
        
        let info: [Funds.FetchFunds.ViewModel.DisplayedInfo] = [Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Taxa de administração", data: "0,50%"),
                                   Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Aplicação inicial", data: "R$ 10.000,00"),
                                   Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Movimentação mínima", data: "R$ 1.000,00"),
                                   Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Saldo mínimo", data: "R$ 5.000,00"),
                                   Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Resgate (valor bruto)", data: "D+0"),
                                   Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Cota (valor bruto)", data: "D+1"),
                                   Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Pagamento (valor bruto)", data: "D+2")]
        
        let downInfo: [Funds.FetchFunds.ViewModel.DisplayedInfo] = [Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Essenciais", data: nil),
                                       Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Desempenho", data: nil),
                                       Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Complementares", data: nil),
                                       Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Regulamento", data: nil),
                                       Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Adesão", data: nil)]
        
        let displayedFund = Funds.FetchFunds.ViewModel.DisplayedFund(title: "Fundos de investimento", fundName: "Vinci Valorem FI Multimercado", whatIs: "O que é?", definition: "O Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos.", riskTitle: "Grau de risco do investimento", risk: 4, infoTitle: "Mais informações sobre o investimento", moreInfo: moreInfo, info: info, downInfo: downInfo)
        let displayedFunds = [displayedFund]
        let viewModel = Funds.FetchFunds.ViewModel(displayedFunds: displayedFunds)
        sut.displayFetchedFunds(viewModel: viewModel)
        
        // Then
        XCTAssert(tableViewSpy.reloadDataCalled, "Displaying fetched funds should reload the table view")
    }
    
    func testNumberOfSectionsInTableViewShouldAlwaysBeOne() {
        // Given
        let tableView = sut.tableView
        
        // When
        let numberOfSections = sut.numberOfSections(in: tableView!)
        
        // Then
        XCTAssertEqual(numberOfSections, 1, "The number of table view sections should always be 1")
    }
    
    func testNumberOfRowsInAnySectionShouldEqualNumberOfFundsToDisplay() {
        // Given
        let tableView = sut.tableView
        let month = Funds.FetchFunds.ViewModel.DisplayedMonth(fund: 0.3, cdi: 0.3)
        let year = Funds.FetchFunds.ViewModel.DisplayedYear(fund: 13.01, cdi: 12.08)
        let twelveMonths = Funds.FetchFunds.ViewModel.DisplayedTwelveMonths(fund: 17.9, cdi: 17.6)
        let moreInfo = Funds.FetchFunds.ViewModel.DisplayedMoreInfo(month: month, year: year, twelveMonths: twelveMonths)
        
        let info: [Funds.FetchFunds.ViewModel.DisplayedInfo] = [Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Taxa de administração", data: "0,50%"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Aplicação inicial", data: "R$ 10.000,00"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Movimentação mínima", data: "R$ 1.000,00"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Saldo mínimo", data: "R$ 5.000,00"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Resgate (valor bruto)", data: "D+0"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Cota (valor bruto)", data: "D+1"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Pagamento (valor bruto)", data: "D+2")]
        
        let downInfo: [Funds.FetchFunds.ViewModel.DisplayedInfo] = [Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Essenciais", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Desempenho", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Complementares", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Regulamento", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Adesão", data: nil)]
        
        let displayedFund = Funds.FetchFunds.ViewModel.DisplayedFund(title: "Fundos de investimento", fundName: "Vinci Valorem FI Multimercado", whatIs: "O que é?", definition: "O Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos.", riskTitle: "Grau de risco do investimento", risk: 4, infoTitle: "Mais informações sobre o investimento", moreInfo: moreInfo, info: info, downInfo: downInfo)
        let testDisplayedFunds = [displayedFund]
        sut.displayedFunds = testDisplayedFunds
        
        // When
        let numberOfRows = sut.tableView(tableView!, numberOfRowsInSection: 0)
        
        // Then
        XCTAssertEqual(numberOfRows, testDisplayedFunds.count, "The number of table view rows should equal the number of funds to display")
    }
    
    func testShouldConfigureTableViewFundToDisplayFund() {
        // Given
        let tableView = sut.tableView
        let month = Funds.FetchFunds.ViewModel.DisplayedMonth(fund: 0.3, cdi: 0.3)
        let year = Funds.FetchFunds.ViewModel.DisplayedYear(fund: 13.01, cdi: 12.08)
        let twelveMonths = Funds.FetchFunds.ViewModel.DisplayedTwelveMonths(fund: 17.9, cdi: 17.6)
        let moreInfo = Funds.FetchFunds.ViewModel.DisplayedMoreInfo(month: month, year: year, twelveMonths: twelveMonths)
        
        let info: [Funds.FetchFunds.ViewModel.DisplayedInfo] = [Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Taxa de administração", data: "0,50%"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Aplicação inicial", data: "R$ 10.000,00"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Movimentação mínima", data: "R$ 1.000,00"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Saldo mínimo", data: "R$ 5.000,00"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Resgate (valor bruto)", data: "D+0"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Cota (valor bruto)", data: "D+1"),
                                                                Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Pagamento (valor bruto)", data: "D+2")]
        
        let downInfo: [Funds.FetchFunds.ViewModel.DisplayedInfo] = [Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Essenciais", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Desempenho", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Complementares", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Regulamento", data: nil),
                                                                    Funds.FetchFunds.ViewModel.DisplayedInfo(name: "Adesão", data: nil)]
        
        let displayedFund = Funds.FetchFunds.ViewModel.DisplayedFund(title: "Fundos de investimento", fundName: "Vinci Valorem FI Multimercado", whatIs: "O que é?", definition: "O Fundo tem por objetivo proporcionar aos seus cotistas rentabilidade no longo prazo através de investimentos.", riskTitle: "Grau de risco do investimento", risk: 4, infoTitle: "Mais informações sobre o investimento", moreInfo: moreInfo, info: info, downInfo: downInfo)
        let testDisplayedFunds = [displayedFund]
        sut.displayedFunds = testDisplayedFunds
        
        // When
        let indexPath = IndexPath(row: 0, section: 0)
        let cell = sut.tableView(tableView!, cellForRowAt: indexPath)
        
        // Then
        XCTAssertEqual(sut.lblTitle?.text, "Fundos de investimento", "A properly configured table view fund should display the fund message")
    }
}
