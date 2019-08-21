//
//  SwinjectStoryboard+Setup.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 16/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import SwinjectStoryboard
import RxSwift
import Domain
import Platform

extension SwinjectStoryboard {
    @objc class func setup() {
        
        // MARK: UseCases
//        app = XCUIApplication()
//        app.launchArguments.append("TESTING")
//        app.launch()
        if ProcessInfo.processInfo.arguments.contains("TESTING") {
            defaultContainer.register(Domain.ApiUseCase.self) { _ in ApiUseCaseMock() }
        } else {
            defaultContainer.register(Domain.ApiUseCase.self) { _ in Platform.UseCaseManager.getApiUseCase() }
        }
        
        
        // MARK: View Controllers
        defaultContainer.storyboardInitCompleted(FormViewController.self) { (r, c) in
            let apiUseCase = r.resolve(ApiUseCase.self)!
            c.presenter = FormViewPresenterImplementation(view: c, apiUseCase: apiUseCase)
        }
        defaultContainer.storyboardInitCompleted(MainTabViewController.self) { (r, c) in }
        defaultContainer.storyboardInitCompleted(UIViewController.self) { (r, c) in }
        defaultContainer.storyboardInitCompleted(UINavigationController.self) { (r, c) in }
    }
}
