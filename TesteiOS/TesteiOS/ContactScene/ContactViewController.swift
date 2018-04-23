import UIKit
import SkyFloatingLabelTextField
import RxSwift
import Moya

protocol ContactDisplayLogic: class {
  func displaySomething(viewModel: Contact.Something.ViewModel)
}

class ContactViewController: UIViewController, ContactDisplayLogic {
  var interactor: ContactBusinessLogic?
  var router: (NSObjectProtocol & ContactRoutingLogic & ContactDataPassing)?

  // MARK: Object lifecycle
  
  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  // MARK: Setup
  
  private func setup() {
    let viewController = self
    let interactor = ContactInteractor()
    let presenter = ContactPresenter()
    let router = ContactRouter()
    viewController.interactor = interactor
    viewController.router = router
    interactor.presenter = presenter
    presenter.viewController = viewController
    router.viewController = viewController
    router.dataStore = interactor
  }
  
  // MARK: Routing
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let scene = segue.identifier {
      let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
      if let router = router, router.responds(to: selector) {
        router.perform(selector, with: segue)
      }
    }
  }
  
  // MARK: View lifecycle
  
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    doSomething()
    
    nameTextField.placeholder = "Nome Completo"
    nameTextField.title = "Nome Completo"
    emailTextField.placeholder = "Email"
    emailTextField.title = "Email"
    phoneTextField.placeholder = "Telefone"
    phoneTextField.title = "Telefone"
    
    CellManager.getCells().subscribe(onNext: { (cells) in
      print(cells)
    }, onError: { (error) in
      print(error)
    }, onCompleted: {
      print("Completed")
    }).disposed(by: disposeBag)
    
    
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
  @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
  @IBOutlet weak var phoneTextField: SkyFloatingLabelTextField!
  
  func doSomething()
  {
    let request = Contact.Something.Request()
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Contact.Something.ViewModel)
  {
    //nameTextField.text = viewModel.name
  }
}
