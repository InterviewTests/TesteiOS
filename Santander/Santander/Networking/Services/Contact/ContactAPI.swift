//
//  ContactAPI.swift
//  Santander
//
//  Created by Orlando Amorim on 12/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit
import Moya
import RxSwift

class ContactAPI: ContactStoreProtocol {
    
    private let provider = MoyaProvider<ContactTarget>()
    var disposeBag: DisposeBag = DisposeBag()
    
    func getForm(result: @escaping (Result<ContactForm, Error>) -> Void) {
        disposeBag = DisposeBag()
        provider.rx.request(.getForm).map(ContactForm.self).asObservable().subscribe(onNext: { contactForm in
            result(.success(contactForm))
        }, onError: { error in
            result(.failure(error))
        }).disposed(by: disposeBag)
    }
}
