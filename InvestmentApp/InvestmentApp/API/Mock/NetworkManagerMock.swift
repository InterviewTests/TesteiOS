//
//  NetworkManagerMock.swift
//  NubankExerciseTests
//
//  Created by Matheus Weber on 31/03/18.
//  Copyright © 2018 Matheus Weber. All rights reserved.
//

import Foundation

class NetworkManagerMock<T>: NetworkManager {
    var shouldReturn: Result<NetworkResponse> = .success
    var expectedAnswer: T? = nil
    
    override func request<T: Codable>(request: InvestmentAPI,
                                      success: @escaping (_ result: T) -> (),
                                      failure: @escaping (_ error: NetworkResponse) -> ()) {
        switch(shouldReturn){
        case .success:
            if let expectedAnswer = expectedAnswer as? T {
                success(expectedAnswer)
            }
        case .failure(let error):
            failure(error)
        }
    }
    
    override func request(request: InvestmentAPI,
                          success: @escaping (_ result: String) -> (),
                          failure: @escaping (_ error: NetworkResponse) -> ()) {
        switch(shouldReturn){
        case .success:
            success("Ok")
        case .failure(let error):
            failure(error)
        }
    }
}
