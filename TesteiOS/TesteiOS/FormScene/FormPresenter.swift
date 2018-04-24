import UIKit

protocol FormPresentationLogic {
  func presentForm(response: Form.Response)
}

class FormPresenter: FormPresentationLogic {
  weak var viewController: FormDisplayLogic?
  
  func presentForm(response: Form.Response) {
    let viewModel = Form.ViewModel(screen: response.screen)
    viewController?.displayForm(viewModel: viewModel)
  }
}
