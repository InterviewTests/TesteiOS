//
//  CustomTabBarViewController.swift
//  SantanderTeste
//
//  Created by Rafael Macito on 13/05/2018.
//  Copyright © 2018 Rafael Macito. All rights reserved.
//

import UIKit

class CustomTabBarViewController: BaseViewController {
    
    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var tabBarStack: UIStackView!
    
    var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageViewController.view.translatesAutoresizingMaskIntoConstraints = false
       return pageViewController
    }()
    var viewControllers: [UIViewController] = []
    private var selectedTabBarView: TabBarView? {
        willSet {
            selectedTabBarView?.setSelected(false)
        }
        
        didSet {
            selectedTabBarView?.setSelected(true)
            
            if let view = selectedTabBarView {
                tabBarStack?.bringSubview(toFront: view)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setPageController()
        configureView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let vc = viewControllers.first {
            selectedTabBarView = tabBarStack.arrangedSubviews.first as? TabBarView
            pageViewController.setViewControllers([vc], direction: .forward, animated: true)
        }
    }
    
    // MARK: Custom
    
    func setPageController() {
        addChildViewController(pageViewController)
        containerView.addSubview(pageViewController.view)
        pageViewController.view.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        pageViewController.view.leftAnchor.constraint(equalTo: containerView.leftAnchor).isActive = true
        pageViewController.view.rightAnchor.constraint(equalTo: containerView.rightAnchor).isActive = true
        pageViewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    func configureView() {
        tabBarStack.subviews.forEach({
            $0.removeFromSuperview()
        })
        
        for (index, vc) in viewControllers.enumerated() {
            guard let tabView = TabBarView.fromNib("TabBarView") as? TabBarView else { return }
            
            (vc as? BaseViewController)?.index = index
            tabView.title = vc.title ?? "skajfhasjf"
            tabView.viewController = vc
            tabView.onSelected = { [weak self] (tabView) in
                if tabView != self?.selectedTabBarView,
                    let vc = tabView.viewController as? BaseViewController {
                    if let actualVC = self?.selectedTabBarView?.viewController as? BaseViewController,
                        actualVC.index < vc.index {
                        self?.pageViewController.setViewControllers([vc], direction: .forward, animated: true)
                    } else {
                        self?.pageViewController.setViewControllers([vc], direction: .reverse, animated: true)
                    }
                    
                    self?.selectedTabBarView = tabView
                }
            }
            
            tabBarStack?.addArrangedSubview(tabView)
        }
    }
}

extension CustomTabBarViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    // MARK: UIPageViewControllerDataSource
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard var index = (viewController as? BaseViewController)?.index else { return nil }
        if index == 0 || index == NSNotFound {
            return nil
        }
        
        index -= 1
        
        return viewControllers[index]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard var index = (viewController as? BaseViewController)?.index else { return nil }
        
        index += 1
        
        if index == viewControllers.count {
            return nil
        }
        
        return viewControllers[index]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return viewControllers.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    // MARK: UIPageViewControllerDelegate
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let viewController = pageViewController.viewControllers?.first as? BaseViewController {
            selectedTabBarView = tabBarStack.arrangedSubviews[viewController.index] as? TabBarView
        }
    }
}
