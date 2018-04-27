//
//  FormViewControllerSpec.swift
//  InvestmentAppTests
//
//  Created by Matheus Weber on 21/04/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Quick
import Nimble
import Nimble_Snapshots

@testable import InvestmentApp

final class FormViewControllerSpec: QuickSpec {
    class FormPresenterMock: FormPresenter {
        var presentErrorCalled = false
        
        override func presentError(error: NetworkResponse) {
            super.presentError(error: error)
            presentErrorCalled = true
        }
    }
    
    class FormRouterMock: FormRouter {
        var routerToMainCalled = false
        
        override func routerToMain() {
            super.routerToMain()
            routerToMainCalled = true
        }
    }
    
    override func spec() {
        var sut: FormViewController!
        var api: NetworkManagerMock<Any>!
        var cellsMock: [CellModel] = [CellModel]()
        var presenter: FormPresenterMock!
        var router: FormRouterMock!

        describe("given FormViewController") {
            beforeEach {
                api = NetworkManagerMock()
            }
            
            context("when initializing FormViewController with mocked API for success") {
                beforeEach {
                    let mockable = Mockable()
                    let worker = FormWorker(manager: api)
                    let cellsModel = mockable.mock(type: CellsModel.self, jsonFile: "cells")
                    router = FormRouterMock()
                    cellsMock = cellsModel.cells
                    api.shouldReturn = .success
                    api.expectedAnswer = cellsModel
                    
                    sut = FormViewController(interactor: FormInteractor(worker: worker), router: router)
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
                    sut.displayForm(viewModel: FormViewModel(cells: cellsMock))
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
                
                it("should call routerToMain") {
                    sut.didClickButton()
                    expect(router.routerToMainCalled).to(beTruthy())
                }
            }
            
            context("when initializing FormViewController with mocked API for internet error") {
                beforeEach {
                    let mockable = Mockable()
                    let worker = FormWorker(manager: api)
                    presenter = FormPresenterMock()
                    
                    let cellsModel = mockable.mock(type: CellsModel.self, jsonFile: "cells")
                    api.shouldReturn = .failure(NetworkResponse.noInternetConnection)
                    api.expectedAnswer = cellsModel
                    
                    sut = FormViewController(interactor: FormInteractor(worker: worker), presenter: presenter)
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
