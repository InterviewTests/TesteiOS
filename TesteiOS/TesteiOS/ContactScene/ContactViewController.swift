import UIKit
import SkyFloatingLabelTextField
import RxSwift
import Moya

protocol ContactDisplayLogic: class {
  func displaySomething(viewModel: Contact.ViewModel)
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
    
    
  }
  
  // MARK: Do something
  
  //@IBOutlet weak var nameTextField: UITextField!
  @IBOutlet weak var nameTextField: SkyFloatingLabelTextField!
  @IBOutlet weak var emailTextField: SkyFloatingLabelTextField!
  @IBOutlet weak var phoneTextField: SkyFloatingLabelTextField!
  @IBOutlet weak var firsLabel: UILabel!
  @IBOutlet weak var sendButton: UIButton!
  
  func doSomething() {
    let request = Contact.Request(cells: nil)
    interactor?.doSomething(request: request)
  }
  
  func displaySomething(viewModel: Contact.ViewModel) {
    print(viewModel)
    
    self.firsLabel.text = viewModel.cells?.cells[0].message
    
    self.nameTextField.placeholder = viewModel.cells?.cells[1].message
    self.nameTextField.title = viewModel.cells?.cells[1].message
    
    self.emailTextField.placeholder = viewModel.cells?.cells[2].message
    self.emailTextField.title = viewModel.cells?.cells[2].message
    
    self.phoneTextField.placeholder = viewModel.cells?.cells[3].message
    self.phoneTextField.title = viewModel.cells?.cells[3].message
    

  }
  
  @IBAction func sendButtonAction(_ sender: Any) {
    
    
    
  }
  
  
  
}
