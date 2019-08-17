//
//  ContainerViewController.swift
//  Santander
//
//  Created by Orlando Amorim on 10/08/19.
//  Copyright © 2019 Santander. All rights reserved.
//

import UIKit
import SnapKit

class ContainerViewController: UIViewController {
    
    //MARK: - Views
    private var containedSegmentedView: SegmentedControl = {
        var segmentedControl = SegmentedControl()
        segmentedControl.set(buttons: [("Investimento", true), ("Contato", false)])
        return segmentedControl
    }()
    
    private lazy var investmentViewController: InvestmentViewController = {
        let viewController = InvestmentViewController()
        return viewController
    }()
    
    private lazy var contactViewController: ContactViewController = {
        let viewController = ContactViewController()
        return viewController
    }()
    
    private lazy var shareButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = UIImage(named: "share-icon")
        return button
    }()

    enum ContainerType: Int {
        case funds = 0
        case contact = 1
        
        var title: String {
            switch self {
            case .funds:
                return "Investimento"
            case .contact:
                return "Contato"
            }
        }
    }
    
    //MARK: - Vars
    private var selectedType: ContainerType = .funds

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupSelectionHandler()
        select(type: .funds)
    }
    
    private func setupView() {
        view.backgroundColor = .white
        addContainedSegmentedView()
        setupNavigationController()
    }
    
    private func setupNavigationController() {
        guard let navigationController = navigationController else {
            return
        }
        navigationController.navigationBar.titleTextAttributes =
            [.foregroundColor: UIColor.Santander.mineShaft,
             .font: UIFont.santander(type: .medium, with: 16.0)]
        if #available(iOS 11.0, *) {
            navigationController.navigationBar.prefersLargeTitles = false
        }
        navigationController.navigationBar.backgroundColor = .black
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = false
        navigationController.view.backgroundColor = .white
        navigationController.navigationBar.tintColor = UIColor.Santander.monza
    }
    
    private func addContainedSegmentedView() {
        view.addSubview(containedSegmentedView)
        containedSegmentedView.snp.makeConstraints { make in
            make.height.equalTo(57.0)
            make.leading.trailing.equalToSuperview()
            if #available(iOS 11.0, *) {
                make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
            } else {
                make.bottom.equalToSuperview()
            }
        }
    }
    
    private func setupSelectionHandler() {
        containedSegmentedView.onTap { [weak self] index in
            guard let self = self, let type = ContainerType(rawValue: index) else {
                return
            }
            self.select(type: type)
        }
    }
    
    private func select(type: ContainerType) {
        let viewControllers = [investmentViewController, contactViewController]
        removeChildVc(viewControllers[type.rawValue])
        addChildVc(viewControllers[type.rawValue])
        title = type.title
        selectedType = type
        managerNavigationButton(type: type)
    }
    
    private func addChildVc(_ child: UIViewController) {
        addChild(child)
        view.insertSubview(child.view, belowSubview: containedSegmentedView)
        child.view.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview()
            make.bottom.equalTo(containedSegmentedView.snp.top)
        }
        child.didMove(toParent: self)
    }

    private func removeChildVc(_ child: UIViewController) {
        child.willMove(toParent: self)
        child.removeFromParent()
        child.view.removeFromSuperview()
    }
    
    private func managerNavigationButton(type: ContainerType) {
        switch type {
        case .funds:
            navigationItem.setRightBarButtonItems([shareButton], animated: false)
        case .contact:
            navigationItem.setRightBarButtonItems([], animated: false)
        }
    }
}
