//
//  ApiUseCase.swift
//  Domain
//
//  Created by Erika de Almeida Segatto on 03/08/19.
//  Copyright © 2019 Erika de Almeida Segatto. All rights reserved.
//

import Foundation
import RxSwift


public protocol ApiUseCase {
    func getFormFields() -> Observable<[FormCell]>
    func getFundInfo() -> Observable<Fund>
    func sendForm(_ form: [FormCell]) -> Observable<Void>
}
