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
    @IBOutlet weak var indicatorViewConstraint: NSLayoutConstraint!
    
    private var currentSelectedButton: UIButton?
    
    // MARK: - Child controllers
    lazy var fundsViewController: FundsViewController = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "FundsViewController")
        guard let fundsController = controller as? FundsViewController else { return FundsViewController() }
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
        didTouchAt(formButton)
    }
    
    private func addControllerToContainer(controllerToAdd controller: UIViewController) {
        addChild(controller)
        
        containerView.addSubview(controller.view)
        
        controller.view.frame = containerView.bounds
        controller.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        controller.didMove(toParent: self)
    }
    
    private func removeControllerFromContainer(controllerToRemove controller: UIViewController) {
        controller.willMove(toParent: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParent()
    }
    
    private func updateContainerView() {
        if currentSelectedButton == formButton {
            if containerView.subviews.contains(fundsViewController.view) {
                removeControllerFromContainer(controllerToRemove: fundsViewController)
                addControllerToContainer(controllerToAdd: formViewController)
            }
        } else {
            if containerView.subviews.contains(formViewController.view) {
                removeControllerFromContainer(controllerToRemove: formViewController)
                addControllerToContainer(controllerToAdd: fundsViewController)
            }
        }
    }
    
    private func updateIndicatorView() {
        view.setNeedsLayout()
        view.layoutIfNeeded()

        guard let currentButton = currentSelectedButton else { return }
        indicatorViewConstraint.constant = currentButton.frame.origin.x
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
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
        updateIndicatorView()
        updateContainerView()
    }
}
