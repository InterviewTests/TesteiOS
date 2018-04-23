import UIKit
import Moya
import RxSwift

protocol FormBusinessLogic {
  func getForm(request: Form.Request)
}

protocol FormDataStore {
  //var name: String { get set }
}

class FormInteractor: FormBusinessLogic, FormDataStore {
  
  var presenter: FormPresentationLogic?
  var worker: FormWorker?
  let disposeBag = DisposeBag()
  
  func getForm(request: Form.Request) {
    
    FundManager.getFund().subscribe(onNext: { (fund) in
      let response = Form.Response(screen: fund.screen)
      self.presenter?.presentForm(response: response)
    }, onError: { (error) in
      print(error)
    }, onCompleted: {
      print("Completed")
    }).disposed(by: disposeBag)
    
  }
}
