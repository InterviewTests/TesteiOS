//  BaseRouter.swift
//  ShareKNX
//
//  Created by Daniel Reis on 26/09/17.
//  Copyright © 2017 MadeinWeb. All rights reserved.
//

import UIKit

public enum PresentationStyle {
    
    case modal
    case push
}

class BaseRouterViewController {
    
    private(set) weak var controller: UIViewController?
    private(set) var style: PresentationStyle

    init(controller: UIViewController?, style: PresentationStyle) {
        self.controller = controller
        self.style = style
    }
}

class BaseRouter {
    
    private static var _viewControllerStack: [BaseRouterViewController] = []
    private static var viewControllerStack: [BaseRouterViewController] {
        get {
            _viewControllerStack = _viewControllerStack.filter { $0.controller != nil }
            return _viewControllerStack
        }
        
        set (value) {
            _viewControllerStack = value
        }
    }
    
    private static var currentRouter: BaseRouterViewController? {
        return viewControllerStack.last
    }
    
    private static func add(controller: UIViewController, style: PresentationStyle) {
        if let navigationVC = controller as? UINavigationController, let vc = navigationVC.viewControllers.first {
            viewControllerStack.append(BaseRouterViewController(controller: vc, style: style))
        } else {
            viewControllerStack.append(BaseRouterViewController(controller: controller, style: style))
        }
    }
    
    static func setRoot(controller: UIViewController) {
        guard let window = UIApplication.shared.delegate?.window else { return }
        
        window?.rootViewController = controller
    }
    
    static func pushViewController(controller: UIViewController) {
        guard let navigation = currentRouter?.controller?.navigationController else { return }
        
        navigation.pushViewController(controller, animated: true)
        
        add(controller: controller, style: .push)
    }
    
    static func presentViewController(controller: UIViewController, animated: Bool) {
        guard let controller = currentRouter?.controller else { return }
        
        controller.present(controller, animated: animated, completion: nil)

        add(controller: controller, style: .modal)
    }
    
    static func dismissViewController() {
        guard let router = currentRouter,
            let controller = router.controller else { return }

        switch router.style {
        case .modal:
            controller.dismiss(animated: true, completion: nil)
        case .push:
            if controller == controller.navigationController?.viewControllers.first {
                controller.navigationController?.dismiss(animated: true, completion: nil)
            } else {
                controller.navigationController?.popViewController(animated: true)
            }
        }
        
        if let index = viewControllerStack.index(where: { $0 === router }) {
            viewControllerStack.remove(at: index)
        }
    }
}
