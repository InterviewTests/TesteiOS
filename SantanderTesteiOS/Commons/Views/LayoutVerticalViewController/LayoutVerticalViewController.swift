//
//  SantanderLabelView.swift
//  SantanderTesteiOS
//
//  Created by Diego Costa on 22/09/18.
//  Copyright © 2018 Diego Costa. All rights reserved.
//


import UIKit
import Foundation

protocol LayoutVerticalViewProtocol {
    
    func insert(view : UIView, above : UIView)
    
    func insert(view : UIView, below : UIView)
    
    func insert(view : UIView, at : Int)
}

extension LayoutVerticalViewProtocol {
    
    var spaceView : (UIColor, CGFloat)-> UIView {
        return {
            let spaceView = UIView()
            spaceView.translatesAutoresizingMaskIntoConstraints = false
            spaceView.backgroundColor   = $0
            spaceView.frame.size.height = $1
            return spaceView
        }
    }
    
    var lineView : (UIColor, CGFloat)-> UIView {
        return {
            let lineView = UIView()
            lineView.translatesAutoresizingMaskIntoConstraints = false
            lineView.backgroundColor   = $0
            lineView.frame.size.height = $1
            return lineView
        }
    }
}

class LayoutVerticalViewController: UIViewController, LayoutVerticalViewProtocol {
    private var scrollView      : UIScrollView = UIScrollView()
    private var stackView       : UIStackView  = UIStackView()
    private var footerStackView : UIStackView  = UIStackView()
    
    
    var spacing : CGFloat = 0
    
    var contentInsets   : UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16) {
        didSet{
            self.updateViewConstraints()
        }
    }
    
    var showsVerticalIndicator : Bool = false {
        didSet { scrollView.showsVerticalScrollIndicator = showsVerticalIndicator }
    }
    
    var showHorizontalIndicator : Bool = false {
        didSet { scrollView.showsHorizontalScrollIndicator = showHorizontalIndicator }
    }
    
    var subviews : [UIView] {
        return []
    }
    
    var footerViews : [UIView] {
        return []
    }
    
    override func loadView() {
        super.loadView()
        self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.prepareLayout()
    }
    
    private func prepareLayout() {
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator     = showsVerticalIndicator
        scrollView.showsHorizontalScrollIndicator   = showHorizontalIndicator
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.axis      = .vertical
        stackView.spacing   = spacing
        stackView.distribution = .fill
        stackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        footerStackView.translatesAutoresizingMaskIntoConstraints = false
        footerStackView.alignment = .fill
        footerStackView.axis      = .horizontal
        footerStackView.spacing   = 1
        footerStackView.distribution = .fillEqually
        footerStackView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        view.addSubview(scrollView)
        view.addSubview(footerStackView)
        scrollView.addSubview(stackView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.subviews.forEach {
            addHeight(view: $0)
            stackView.addArrangedSubview($0)
        }
        self.footerViews.forEach {
            addHeight(view: $0)
            footerStackView.addArrangedSubview($0)
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.stackView.arrangedSubviews.forEach {
            self.updateHeight(view: $0, newValue: $0.frame.height)
        }
    }
    
    override func updateViewConstraints() {
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo:    view.leadingAnchor, constant : contentInsets.left),
            scrollView.trailingAnchor.constraint(equalTo:   view.trailingAnchor, constant : -contentInsets.right),
            scrollView.topAnchor.constraint(equalTo:        view.topAnchor, constant : contentInsets.top),
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo:     scrollView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo:scrollView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo:  scrollView.bottomAnchor),
            stackView.widthAnchor.constraint(equalTo:   scrollView.widthAnchor)
        ])
        
        NSLayoutConstraint.activate([
            footerStackView.topAnchor.constraint(equalTo:      scrollView.bottomAnchor, constant : 16),
            footerStackView.leadingAnchor.constraint(equalTo:  view.leadingAnchor),
            footerStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerStackView.bottomAnchor.constraint(equalTo:   view.bottomAnchor)
            ])
        
        super.updateViewConstraints()
    }
    
    func insert(view: UIView, above: UIView) {
        guard let index = index(view: above), index > 0 else {
            return
        }
        stackView.insertArrangedSubview(view, at: index - 1)
        addHeight(view: view)
    }
    
    func insert(view: UIView, below: UIView) {
        guard let index = index(view: below) else {
            return
        }
        stackView.insertArrangedSubview(view, at: index + 1)
        addHeight(view: view)
    }
    
    func insert(view: UIView, at: Int) {
        stackView.insertArrangedSubview(view, at: at)
        addHeight(view: view)
    }
    
    private func index(view : UIView)-> Int? {
        guard let index = stackView.arrangedSubviews.index(of: view) else {
            return nil
        }
        return index
    }
    
    private func addHeight(view : UIView, value : CGFloat? = nil) {
        let constant = value ?? view.bounds.height
        let constraint = view.heightAnchor.constraint(equalToConstant: constant)
        constraint.identifier = "height"
        constraint.isActive   = true
    }
    
    private func updateHeight(view : UIView, newValue : CGFloat? = nil) {
        let constant = newValue ?? view.bounds.height
        let constraint = view.constraints.filter({$0.identifier == "height"}).first
        constraint?.constant = constant
    }
}
