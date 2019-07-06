//
// ViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 04/07/19.
//

import UIKit

protocol FormPresentableProtocol: AnyObject {
    func displayForm(_ form: String)
    func displayError(_ error: String)
}

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    var interactor: FormInteractor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let presenter = FormPresenter(view: self)
        self.interactor = FormInteractor(presenter: presenter)
        
        interactor?.fetchForm()
    }

    @IBAction func didTouchRequest(_ button: UIButton) {
        let a = ProductionNetworkProvider.init()
        a.fetchFormData { (result) in
            print(result)
        }
    }

}

extension ViewController: FormPresentableProtocol {
    func displayForm(_ form: String) {
        textView.text = form
    }
    
    func displayError(_ error: String) {
        textView.text = error
    }
}
