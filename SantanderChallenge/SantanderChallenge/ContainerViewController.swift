//
// ContainerViewController.swift
// SantanderChallenge
//
// Created for SantanderChallenge on 07/07/19.
//

import UIKit

class ContainerViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var fundsButton: UIButton!
    @IBOutlet weak var formButton: UIButton!
    @IBOutlet weak var indicatorView: UIView!
    
    private var currentSelectedButton: UIButton?
    
    // MARK: - Child controllers
    lazy var fundsViewController: UIViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FundsViewController")
        guard let fundsController = controller as? UIViewController else { return UIViewController() }
        return fundsController
    }()
    
    lazy var formViewController: FormViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FormViewController")
        guard let formController = controller as? FormViewController else { return FormViewController() }
        return formController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addControllerToContainer(controllerToAdd: formViewController)
        addControllerToContainer(controllerToAdd: fundsViewController)
        
        didTouchAt(formButton)
    }
    
    private func addControllerToContainer(controllerToAdd controller: UIViewController) {
        addChild(controller)
        
        containerView.addSubview(controller.view)
        
        controller.view.frame = containerView.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        controller.didMove(toParent: self)
    }
    
    private func updateContainerView() {
        formViewController.view.isHidden = !(currentSelectedButton == formButton)
        fundsViewController.view.isHidden = currentSelectedButton == formButton
    }
    
    private func updateIndicatorView() {
        guard let currentButton = currentSelectedButton else { return }
        UIView.animate(withDuration: 0.5) {
            self.indicatorView.frame.origin.x = currentButton.frame.origin.x
        }
    }
    
    private func updateButtonsBackgroundColor(button: UIButton) {
        currentSelectedButton?.backgroundColor = Colors.unselectedRed
        button.backgroundColor = Colors.selectedRed
    }
    
    // MARK: - Actions
    @IBAction func didTouchAt(_ button: UIButton) {
        updateButtonsBackgroundColor(button: button)
        
        currentSelectedButton = button
        
        updateContainerView()
        updateIndicatorView()
    }
}
