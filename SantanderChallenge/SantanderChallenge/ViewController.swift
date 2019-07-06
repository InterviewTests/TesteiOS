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
        
//        interactor?.fetchForm()
        
        let a = DevelopmentNetworkProvider()
        a.fetchFormData { (result) in
            print(result)
            let data = try! result.get()
            do {
                let cells = try JSONDecoder().decode(FormCellsResponse.self, from: data)
                self.textView.text = "\(cells)"
            } catch {
                print(error)
            }
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
