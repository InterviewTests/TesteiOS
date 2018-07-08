//
//  RootPageViewController.swift
//  TesteiOS
//
//  Created by Felipe Borges on 08/07/18.
//  Copyright © 2018 Felipe Borges. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController {
    
    var investmentsButton: UIButton!
    var contactButton: UIButton!
    var leftLine: UIView!
    var rightLine: UIView!
    
    var currentIndex: Int = 0 {
        didSet {
            updateButtons()
        }
    }
    
    var viewControllersList: [UIViewController] = {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
        let vc1 = storyboard.instantiateViewController(withIdentifier: "investmentsVC")
        let vc2 = storyboard.instantiateViewController(withIdentifier: "contactVC")
        
        return [vc1, vc2]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.dataSource = self
        self.delegate = self
        
        setupView()
        
        if let firstViewController = viewControllersList.first {
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
            currentIndex = 0
        }
    }
  
    @objc func leftButtonClick() {
        if currentIndex != 0 {
           self.setViewControllers([viewControllersList[0]], direction: .reverse, animated: true, completion: nil)
            currentIndex = 0
        }
    }
    
    @objc func rightButtonClick() {
        if currentIndex != 1 {
            self.setViewControllers([viewControllersList[1]], direction: .forward, animated: true, completion: nil)
            currentIndex = 1
        }
    }
}

extension RootPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard
            let vcIndex = viewControllersList.index(of: viewController)
            else { return nil }
        
        let previousIndex = vcIndex - 1
        
        guard
            previousIndex >= 0 &&
            viewControllersList.count > previousIndex
            else { return  nil }
        
        return viewControllersList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard
            let vcIndex = viewControllersList.index(of: viewController)
            else { return nil }
        
        let nextIndex = vcIndex + 1
        
        guard
            viewControllersList.count != nextIndex
            else { return nil }
        
        return viewControllersList[nextIndex]
    }
}

extension RootPageViewController: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if completed {
            if let currentViewController = pageViewController.viewControllers?.first,
                let index = viewControllersList.index(of: currentViewController) {
                currentIndex = index
            }
        }

    }
}
