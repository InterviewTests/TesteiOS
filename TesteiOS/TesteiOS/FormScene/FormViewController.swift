import UIKit
import Moya
import RxSwift

protocol FormDisplayLogic: class {
  func displayForm(viewModel: Form.ViewModel)
}

class FormViewController: UIViewController, FormDisplayLogic {
  var interactor: FormBusinessLogic?
  var router: (NSObjectProtocol & FormRoutingLogic & FormDataPassing)?

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
    let interactor = FormInteractor()
    let presenter = FormPresenter()
    let router = FormRouter()
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
  
  let bag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    getFormFromInteractor()

  }
  
  // MARK: Do something
  
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var fundNameLabel: UITextView!
  @IBOutlet weak var whatIsLabel: UILabel!
  @IBOutlet weak var definitionTextView: UITextView!
  @IBOutlet weak var riskTitleLabel: UILabel!
  @IBOutlet weak var infoTitleLabel: UILabel!
  
  @IBOutlet weak var risk1View: UIImageView!
  @IBOutlet weak var risk2View: UIImageView!
  @IBOutlet weak var risk3View: UIImageView!
  @IBOutlet weak var risk4View: UIImageView!
  @IBOutlet weak var risk5View: UIImageView!
  
  @IBOutlet weak var monthFundLabel: UILabel!
  @IBOutlet weak var monthCdiLabel: UILabel!
  @IBOutlet weak var yearFundLabel: UILabel!
  @IBOutlet weak var yearCdiLabel: UILabel!
  @IBOutlet weak var twelveMonthsFundLabel: UILabel!
  @IBOutlet weak var twelveMonthsCdiLabel: UILabel!
  
  @IBOutlet var infosLabel: [UILabel]!
  
  var count = 0

  func getFormFromInteractor() {
    let request = Form.Request(screen: nil)
    interactor?.getForm(request: request)
  }
  
  func displayForm(viewModel: Form.ViewModel) {
    
    for infoLabel in infosLabel  {
      infoLabel.text = viewModel.screen?.info[count].data
      count = count + 1
    }
    
    self.titleLabel.text = viewModel.screen?.title
    self.fundNameLabel.text = viewModel.screen?.fundName
    self.whatIsLabel.text = viewModel.screen?.whatIs
    self.definitionTextView.text = viewModel.screen?.definition
    self.riskTitleLabel.text =  viewModel.screen?.riskTitle
    self.infoTitleLabel.text = viewModel.screen?.infoTitle
    
    self.monthFundLabel.text = FormatterUtil.formatterFloat(value: (viewModel.screen?.moreInfo.month.fund)!)
    self.monthCdiLabel.text = FormatterUtil.formatterFloat(value: (viewModel.screen?.moreInfo.month.CDI)!)
    self.yearFundLabel.text = FormatterUtil.formatterFloat(value: (viewModel.screen?.moreInfo.year.fund)!)
    self.yearCdiLabel.text = FormatterUtil.formatterFloat(value: (viewModel.screen?.moreInfo.year.CDI)!)
    self.twelveMonthsFundLabel.text = FormatterUtil.formatterFloat(value: (viewModel.screen?.moreInfo.twelveMonths.fund)!)
    self.twelveMonthsCdiLabel.text = FormatterUtil.formatterFloat(value: (viewModel.screen?.moreInfo.twelveMonths.CDI)!)
    
    switch viewModel.screen?.risk {
    case 1 :
      self.risk1View.image = UIImage(named: "Risk1-B")
    case 2 :
      self.risk2View.image = UIImage(named: "Risk2-B")
    case 3 :
      self.risk3View.image = UIImage(named: "Risk3-B")
    case 4 :
      self.risk4View.image = UIImage(named: "Risk4-B")
    case 5 :
      self.risk5View.image = UIImage(named: "Risk5-B")
    default:
      break
    }
  }
  
  @IBAction func downlodAction(_ sender: Any) {
    UIApplication.shared.open(URL(string : "http://www.google.com")!, options: [:], completionHandler: { (status) in
    })
  }
  
  @IBAction func investAction(_ sender: Any) {
    print("INVESTIR")
  }
}
