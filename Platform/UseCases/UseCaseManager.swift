//
//  UseCaseManager.swift
//  TesteiOS
//
//  Created by Erika de Almeida Segatto on 10/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import Domain

public struct UseCaseManager {
    public static func getApiUseCase() -> ApiUseCase {
        return ApiUseCaseImplementation.getUseCase()
    }
}
