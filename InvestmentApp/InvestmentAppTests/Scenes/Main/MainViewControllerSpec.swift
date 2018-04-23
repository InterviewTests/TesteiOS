//
//  MainViewControllerSpec.swift
//  InvestmentAppTests
//
//  Created by Matheus Weber on 23/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import InvestmentApp

final class MainViewControllerSpec: QuickSpec {
    class MainPresenterMock: MainPresenter {
        var presentErrorCalled = false
        
        override func presentError(error: NetworkResponse) {
            super.presentError(error: error)
            presentErrorCalled = true
        }
    }
    
    class MainRouterMock: MainRouter {
        var routerToSafariCalled = false
        
        override func routerToSafari() {
            super.routerToSafari()
            routerToSafariCalled = true
        }
    }
    
    override func spec() {
        var sut: MainViewController!
        var api: NetworkManagerMock<Any>!
        var presenter: MainPresenterMock!
        var router: MainRouterMock!
        var fundMock: FundModel!
        
        describe("given MainViewController") {
            beforeEach {
                api = NetworkManagerMock()
            }
            
            context("when initializing MainViewController with mocked API for success") {
                beforeEach {
                    let mockable = Mockable()
                    let worker = MainWorker(manager: api)
                    let screenModel = mockable.mock(type: ScreenModel.self, jsonFile: "fund")
                    
                    router = MainRouterMock()
                    fundMock = screenModel.screen
                    api.shouldReturn = .success
                    api.expectedAnswer = screenModel
                    
                    sut = MainViewController(interactor: MainInteractor(worker: worker), router: router)
                    sut.loadView()
                    
                    UIWindow.showTestWindow(controller: sut)
                    UIView.setAnimationsEnabled(false)
                    _ = sut.view
                    sut.viewDidLoad()
                    sut.viewDidAppear(false)
                }
                
                afterEach {
                    UIView.setAnimationsEnabled(true)
                    UIWindow.cleanTestWindow()
                }
                
                it("should not be nil") {
                    expect(sut).toNot(beNil())
                }
                
                it("should have the expected layout when success") {
                    sut.displayFunds(viewModel: MainViewModel(fund: fundMock))
                    expect(UIWindow.testWindow) == snapshot("test_view_for_success")
                }
                
                it("should have the expected layout when internet error") {
                    sut.displayError(status: ViewStatus.internetError({}))
                    expect(UIWindow.testWindow) == snapshot("test_view_for_internet_error")
                }
                
                it("should have the expected layout when request error") {
                    sut.displayError(status: ViewStatus.requestError({}))
                    expect(UIWindow.testWindow) == snapshot("test_view_for_request_error")
                }
                
                it("should call routerToSafari") {
                    sut.didClickOnButton()
                    expect(router.routerToSafariCalled).to(beTruthy())
                }
            }
            
            context("when initializing FormViewController with mocked API for internet error") {
                beforeEach {
                    let mockable = Mockable()
                    let worker = MainWorker(manager: api)
                    presenter = MainPresenterMock()
                    
                    let cellsModel = mockable.mock(type: ScreenModel.self, jsonFile: "fund")
                    api.shouldReturn = .failure(NetworkResponse.noInternetConnection)
                    api.expectedAnswer = cellsModel
                    
                    sut = MainViewController(interactor: MainInteractor(worker: worker), presenter: presenter)
                    sut.loadView()
                    
                    UIWindow.showTestWindow(controller: sut)
                    UIView.setAnimationsEnabled(false)
                    _ = sut.view
                    sut.viewDidLoad()
                    sut.viewDidAppear(false)
                }
                
                afterEach {
                    UIView.setAnimationsEnabled(true)
                    UIWindow.cleanTestWindow()
                }
                
                it("should not be nil") {
                    expect(sut).toNot(beNil())
                }
                
                it("should call present error") {
                    expect(presenter.presentErrorCalled).to(beTruthy())
                }
            }
        }
    }
}

