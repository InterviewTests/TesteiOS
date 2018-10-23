//
//  PostDataInteractor.swift
//  TesteiOS
//
//  Created by Gabriel Soria Souza on 22/10/18.
//  Copyright © 2018 Gabriel Sória Souza. All rights reserved.
//

import Foundation
import UIKit


protocol PostToEndpoint {
    func post(dataToBePosted: DetailDataToBePosted)
}

protocol ToBePosted {
    var data: DetailDataToBePosted! { get set }
}

class PostDataInteractor: PostToEndpoint, ToBePosted {
    
    var presenter: DataToBePostedPresenter?
    var data: DetailDataToBePosted!
    
    func post(dataToBePosted: DetailDataToBePosted) {
        let loginData = UserDataForLogin(userId: dataToBePosted.userId, name: dataToBePosted.name, bankAccount: dataToBePosted.bankAccount, agency: dataToBePosted.agency, balance: dataToBePosted.balance)
        let completeLoginData = LoginData.init(userData: loginData, error: nil)
        
        
        RequestAndPostData.postData(loginData: completeLoginData, completion: { (sucess) in
            print(sucess)
        }) { (error) in
            print(error)
        }
    }
}
