//
//  ContactAPI.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit
import Moya

class ContactAPI: ContactStoreProtocol {
    
    private let provider = MoyaProvider<ContactTarget>()
    var cancelable: Cancellable?

    func getForm(result: @escaping (Result<ContactForm, Error>) -> Void) {
        cancelable?.cancel()
        cancelable = provider.request(.getForm, decodeType: ContactForm.self) { responseResult in
            switch responseResult {
            case .success(let contactForm):
                result(.success(contactForm))
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
