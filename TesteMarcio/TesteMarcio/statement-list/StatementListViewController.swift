

import UIKit

protocol StatementViewControllerDisplayLogic {
    func displayLoadStatementList(viewObject: StatementModel.loadStatementList.viewObject)
    func displayShowActivityIndicator(viewObject: StatementModel.ActivityIndicator.ViewObject)
    func displayHideActivityIndicator(viewObject: StatementModel.ActivityIndicator.ViewObject)
}

class StatementListViewController: BaseViewController {

    var statements:[Statement] = []
    var router: StatementRouterRoutingLogic?
    
    
    @IBOutlet weak var statementTableView: UITableView!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userCountAgencyLabel: UILabel!
    @IBOutlet weak var userBalanceLabel: UILabel!
    
    var user: UserAccount?
    var interactor: StatementInteractorBusinessLogic?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userNameLabel.text = user?.name ?? "Nome não encontrado"
        userBalanceLabel.text = user?.balance?.description ?? "Saldo não encontrado"
        userCountAgencyLabel.text = "\(user?.bankAccount ?? "0000")/\(user?.agency ?? "00.000000-0")"
        
        let textFieldCell = UINib(nibName: "TesteTableViewCell", bundle: Bundle.main)
        self.statementTableView.register(textFieldCell, forCellReuseIdentifier: "StatementCell")
        
        statementTableView.dataSource = self
        statementTableView.delegate = self
        
        if let _ = user {
            interactor?.handleLoadStatementList(request: StatementModel.loadStatementList.request(user: user!))
        }
        
    }
    @IBAction func logout(_ sender: Any) {
        router?.logout(viewController: self	)
    }
    
}

extension StatementListViewController: StatementViewControllerDisplayLogic {
    
    func displayLoadStatementList(viewObject: StatementModel.loadStatementList.viewObject) {
        statements = viewObject.statementList
        statementTableView.reloadData()
    }
    
    func displayShowActivityIndicator(viewObject: StatementModel.ActivityIndicator.ViewObject) {
        showActivityIndicator()
    }
    
    func displayHideActivityIndicator(viewObject: StatementModel.ActivityIndicator.ViewObject) {
        hideActivityIndicator()
    }
}


extension StatementListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statements.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let statement = statements[indexPath.row]
        print(statement)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "StatementCell") as! StatementCellTableViewCell
        
        cell.setStatement(statement: statement)
        
        return cell
    }
}
